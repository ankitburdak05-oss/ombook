import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  int _seconds = 25 * 60;
  bool _running = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Focus Timer',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Zen Sanctuary',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
            const Spacer(),
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.woodMid,
                border: Border.all(color: AppColors.goldAccent, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.goldAccent.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _format(_seconds),
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CircleButton(
                  icon: Icons.refresh,
                  onTap: () => setState(() {
                    _seconds = 25 * 60;
                    _running = false;
                  }),
                ),
                const SizedBox(width: 30),
                _CircleButton(
                  icon: _running ? Icons.pause : Icons.play_arrow,
                  large: true,
                  onTap: () => setState(() => _running = !_running),
                ),
                const SizedBox(width: 30),
                _CircleButton(icon: Icons.skip_next, onTap: () {}),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String _format(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$m:$sec';
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final bool large;
  final VoidCallback onTap;
  const _CircleButton({required this.icon, required this.onTap, this.large = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: large ? AppColors.goldAccent : AppColors.woodLight,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(large ? 24 : 16),
          child: Icon(
            icon,
            color: large ? AppColors.woodDark : AppColors.textPrimary,
            size: large ? 36 : 24,
          ),
        ),
      ),
    );
  }
}
