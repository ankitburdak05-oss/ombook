import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.woodLight,
                      border: Border.all(color: AppColors.goldAccent, width: 3),
                    ),
                    child: const Icon(Icons.person, size: 50, color: AppColors.goldAccent),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ankit Burdak',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Book Lover · Reader since 2024',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stat(label: 'Books Read', value: '42'),
                _Stat(label: 'Streak', value: '12🔥'),
                _Stat(label: 'Hours', value: '128'),
              ],
            ),
            const SizedBox(height: 32),
            _SettingTile(icon: Icons.emoji_events, label: 'Achievements', count: '8'),
            _SettingTile(icon: Icons.bookmark, label: 'Bookmarks', count: '23'),
            _SettingTile(icon: Icons.share, label: 'Share Profile'),
            _SettingTile(icon: Icons.help_outline, label: 'Help & Support'),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.goldAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? count;
  const _SettingTile({required this.icon, required this.label, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.woodMid.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.goldAccent),
        title: Text(label, style: TextStyle(color: AppColors.textPrimary)),
        trailing: count != null
            ? Text(count!, style: TextStyle(color: AppColors.textSecondary))
            : Icon(Icons.chevron_right, color: AppColors.textMuted),
        onTap: () {},
      ),
    );
  }
}
