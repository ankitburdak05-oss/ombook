import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';
import 'book_cover.dart';

class BookshelfWidget extends StatelessWidget {
  final List<Book> books;
  final bool showStatus;
  final bool horizontal;
  final VoidCallback? onBookTap;

  const BookshelfWidget({
    super.key,
    required this.books,
    this.showStatus = true,
    this.horizontal = true,
    this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    if (horizontal) {
      return _HorizontalShelf(books: books, showStatus: showStatus, onBookTap: onBookTap);
    }
    return _VerticalShelf(books: books, showStatus: showStatus, onBookTap: onBookTap);
  }
}

class _HorizontalShelf extends StatelessWidget {
  final List<Book> books;
  final bool showStatus;
  final VoidCallback? onBookTap;

  const _HorizontalShelf({
    required this.books,
    required this.showStatus,
    this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: books.length,
        itemBuilder: (context, i) {
          final book = books[i];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: BookCover(
              book: book,
              width: 90,
              showStatus: showStatus,
              onTap: onBookTap,
            ),
          );
        },
      ),
    );
  }
}

class _VerticalShelf extends StatelessWidget {
  final List<Book> books;
  final bool showStatus;
  final VoidCallback? onBookTap;

  const _VerticalShelf({
    required this.books,
    required this.showStatus,
    this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemCount: books.length,
      itemBuilder: (context, i) {
        final book = books[i];
        return BookCover(
          book: book,
          width: double.infinity,
          showStatus: showStatus,
          onTap: onBookTap,
        );
      },
    );
  }
}
