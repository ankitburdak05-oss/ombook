import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          _SettingsGroup(title: 'Appearance', items: [
            _SettingSwitch(title: 'Dark Mode', value: true),
            _SettingSwitch(title: 'Auto Theme', value: false),
          ]),
          const SizedBox(height: 16),
          _SettingsGroup(title: 'Reading', items: [
            _SettingSwitch(title: 'Daily Reading Reminders', value: true),
            _SettingSwitch(title: 'Show Progress Bar', value: true),
          ]),
          const SizedBox(height: 16),
          _SettingsGroup(title: 'Account', items: [
            _SettingTile(icon: Icons.person_outline, label: 'Edit Profile'),
            _SettingTile(icon: Icons.lock_outline, label: 'Privacy'),
            _SettingTile(icon: Icons.notifications_outlined, label: 'Notifications'),
          ]),
          const SizedBox(height: 16),
          _SettingsGroup(title: 'About', items: [
            _SettingTile(icon: Icons.info_outline, label: 'Version 1.0.0'),
            _SettingTile(icon: Icons.privacy_tip_outlined, label: 'Privacy Policy'),
            _SettingTile(icon: Icons.logout, label: 'Sign Out', danger: true),
          ]),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const _SettingsGroup({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppColors.textMuted,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.woodMid.withOpacity(0.5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool danger;
  const _SettingTile({required this.icon, required this.label, this.danger = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: danger ? Colors.redAccent : AppColors.goldAccent),
      title: Text(label, style: TextStyle(color: danger ? Colors.redAccent : AppColors.textPrimary)),
      trailing: Icon(Icons.chevron_right, color: AppColors.textMuted),
      onTap: () {},
    );
  }
}

class _SettingSwitch extends StatefulWidget {
  final String title;
  final bool value;
  const _SettingSwitch({required this.title, required this.value});

  @override
  State<_SettingSwitch> createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<_SettingSwitch> {
  late bool _value = widget.value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title, style: TextStyle(color: AppColors.textPrimary)),
      trailing: Switch(
        value: _value,
        activeColor: AppColors.goldAccent,
        onChanged: (v) => setState(() => _value = v),
      ),
    );
  }
}
