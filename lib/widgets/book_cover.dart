import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';
import 'status_pill.dart';

class BookCover extends StatelessWidget {
  final Book book;
  final double width;
  final bool showStatus;
  final VoidCallback? onTap;

  const BookCover({
    super.key,
    required this.book,
    required this.width,
    this.showStatus = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = _hexColor(book.coverColor);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book spine with title
          Container(
            width: width,
            height: 160,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
              border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
            ),
            child: Stack(
              children: [
                // Decorative spine lines
                Positioned(
                  top: 6,
                  left: 6,
                  right: 6,
                  child: Container(height: 1, color: Colors.white.withOpacity(0.15)),
                ),
                Positioned(
                  bottom: 6,
                  left: 6,
                  right: 6,
                  child: Container(height: 1, color: Colors.white.withOpacity(0.15)),
                ),
                // Title text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        book.title.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          // Title below
          Text(
            book.title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showStatus) ...[
            const SizedBox(height: 4),
            StatusPill(status: book.status, small: true),
          ],
        ],
      ),
    );
  }

  Color _hexColor(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0xFF')));
  }
}
