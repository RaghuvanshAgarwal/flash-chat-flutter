import 'package:flash_chat/components/rounded_rectangle_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/utility/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/theme.dart';

class WelcomeScreen extends StatefulWidget {
  static const String kPageName = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AnimatedTextController controller = AnimatedTextController();
  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing.s4!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      Constants.kAppName,
                      textStyle: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                          ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: true,
                  controller: controller,
                ),
              ],
            ),
            SizedBox(height: spacing.s5! * 2),
            RoundedRectangleButton(
              label: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.kPageName);
              },
            ),
            RoundedRectangleButton(
              label: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.kPageName);
              },
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
