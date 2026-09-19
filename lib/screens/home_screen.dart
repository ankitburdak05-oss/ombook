import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';
import '../widgets/bookshelf_widget.dart';
import '../widgets/book_cover.dart';
import '../widgets/status_pill.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = SampleBooks.all();
    final reading = books.where((b) => b.status == BookStatus.reading).toList();
    final completed = books.where((b) => b.status == BookStatus.completed).take(4).toList();
    final lent = books.where((b) => b.status == BookStatus.lent).toList();

    return SafeArea(
      child: Column(
        children: [
          _HomeHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 16),
                _FilterRow(),
                const SizedBox(height: 20),
                // Currently Reading — large featured shelf
                _SectionTitle('Currently Reading'),
                const SizedBox(height: 12),
                _FeaturedShelf(books: reading.take(2).toList()),
                const SizedBox(height: 24),
                // Recently Completed
                _SectionTitle('Recently Completed'),
                const SizedBox(height: 12),
                _BookshelfRow(books: completed),
                const SizedBox(height: 24),
                // Lent to Friends
                if (lent.isNotEmpty) ...[
                  _SectionTitle('Lent to Friends'),
                  const SizedBox(height: 12),
                  _BookshelfRow(books: lent),
                  const SizedBox(height: 24),
                ],
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          // Logo (book stack)
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.woodLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.goldAccent, width: 1.5),
            ),
            child: const Icon(Icons.menu_book_rounded, color: AppColors.goldAccent, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mind Focus',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'Books',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          _IconButton(icon: Icons.person_outline, onTap: () {}),
          const SizedBox(width: 8),
          _IconButton(icon: Icons.search, onTap: () {}),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.woodMid.withOpacity(0.6),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: AppColors.textPrimary, size: 20),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PillChip(label: 'Lent', active: false),
        const SizedBox(width: 10),
        _PillChip(label: 'All Books', active: true),
      ],
    );
  }
}

class _PillChip extends StatelessWidget {
  final String label;
  final bool active;
  const _PillChip({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.textPrimary : AppColors.woodMid.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: active ? AppColors.woodDark : AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
      ),
    );
  }
}

class _FeaturedShelf extends StatelessWidget {
  final List<Book> books;
  const _FeaturedShelf({required this.books});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.woodMid.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.shelfEdge, width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _FeaturedBookCard(book: books[0]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FeaturedBookCard(book: books.length > 1 ? books[1] : books[0]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeaturedBookCard extends StatelessWidget {
  final Book book;
  const _FeaturedBookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book spine visualization
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: _hexColor(book.coverColor),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8, offset: const Offset(2, 4)),
            ],
          ),
          child: Stack(
            children: [
              // Spine lines (decorative)
              Positioned(
                top: 8,
                left: 8,
                right: 8,
                child: Container(height: 1, color: AppColors.textMuted.withOpacity(0.3)),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                child: Container(height: 1, color: AppColors.textMuted.withOpacity(0.3)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          book.title.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            height: 1.2,
            letterSpacing: 0.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        StatusPill(status: book.status),
      ],
    );
  }

  Color _hexColor(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0xFF')));
  }
}

class _BookshelfRow extends StatelessWidget {
  final List<Book> books;
  const _BookshelfRow({required this.books});

  @override
  Widget build(BuildContext context) {
    return BookshelfWidget(
      books: books,
      showStatus: true,
    );
  }
}
