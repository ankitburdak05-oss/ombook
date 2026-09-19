import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';

class StatusPill extends StatelessWidget {
  final BookStatus status;
  final bool small;
  const StatusPill({super.key, required this.status, this.small = false});

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final label = _getLabel();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 8 : 14,
        vertical: small ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: small ? 9 : 11,
          fontWeight: FontWeight.w800,
          color: color,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Color _getColor() {
    switch (status) {
      case BookStatus.reading: return AppColors.crimsonReading;
      case BookStatus.completed: return AppColors.forestCompleted;
      case BookStatus.lent: return AppColors.goldAccent;
      case BookStatus.wishlist: return AppColors.textSecondary;
    }
  }

  String _getLabel() {
    switch (status) {
      case BookStatus.reading: return 'Reading';
      case BookStatus.completed: return 'Completed';
      case BookStatus.lent: return 'Lent';
      case BookStatus.wishlist: return 'Wishlist';
    }
  }
}
