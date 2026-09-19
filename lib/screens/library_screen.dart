import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';
import '../widgets/bookshelf_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = SampleBooks.all();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Row(
              children: [
                Text(
                  'My Library',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Icon(Icons.search, color: AppColors.textPrimary, size: 24),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              '${books.length} books collected',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ),
          Expanded(
            child: BookshelfWidget(
              books: books,
              showStatus: true,
              horizontal: false,
            ),
          ),
        ],
      ),
    );
  }
}
