import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/theme.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final seed = Colors.cyan.shade100;
    return MaterialApp(
      theme: AppTheme.buildTheme(seedColor: seed, brightness: Brightness.light),
      darkTheme: AppTheme.buildTheme(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WelcomeScreen();
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
      routes: {
        WelcomeScreen.kPageName: (context) => WelcomeScreen(),
        LoginScreen.kPageName: (context) => LoginScreen(),
        RegistrationScreen.kPageName: (context) => RegistrationScreen(),
        ChatScreen.kPageName: (context) => ChatScreen(),
      },
    );
  }
}
