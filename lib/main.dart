import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/theme.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final seed = Colors.yellow.shade100;
    return MaterialApp(
      theme: AppTheme.buildTheme(seedColor: seed, brightness: Brightness.light),
      darkTheme: AppTheme.buildTheme(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: LoginScreen(),
    );
  }
}
