import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF1A0F08),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const OmBookApp());
}

class OmBookApp extends StatelessWidget {
  const OmBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Focus Books',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeShell(),
    );
  }
}
