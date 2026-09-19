import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'focus_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import '../theme/app_theme.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    LibraryScreen(),
    FocusScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background wooden texture
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.woodDark,
                  AppColors.woodMid.withOpacity(0.4),
                  AppColors.woodDark,
                ],
              ),
            ),
          ),
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
        ],
      ),
      bottomNavigationBar: _WoodenBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

class _WoodenBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _WoodenBottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: Icons.home_rounded, label: 'Home'),
      _NavItem(icon: Icons.menu_book_rounded, label: 'My Library'),
      _NavItem(icon: Icons.timer_rounded, label: 'Focus'),
      _NavItem(icon: Icons.person_rounded, label: 'Profile'),
      _NavItem(icon: Icons.settings_rounded, label: 'Settings'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.woodMid,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
        border: Border(
          top: BorderSide(color: AppColors.shelfEdge, width: 2),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (i) {
            final active = i == currentIndex;
            return Expanded(
              child: InkWell(
                onTap: () => onTap(i),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[i].icon,
                        size: 24,
                        color: active ? AppColors.goldAccent : AppColors.textMuted,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items[i].label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                          color: active ? AppColors.goldAccent : AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
