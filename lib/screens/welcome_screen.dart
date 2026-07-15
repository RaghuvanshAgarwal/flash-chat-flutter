import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/theme.dart';

class WelcomeScreen extends StatefulWidget {
  static const String kPageName = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController logoAnimator;

  @override
  void initState() {
    setupLogoAnimator();
    super.initState();
  }

  @override
  void dispose() {
    logoAnimator.dispose();
    super.dispose();
  }

  void setupLogoAnimator() {
    logoAnimator = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    logoAnimator.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 1), () {
          if (mounted) {
            logoAnimator.forward(from: 0);
          }
        });
      }
    });
    logoAnimator.forward();
  }

  int getLogoLabelSubstringValue() {
    const String label = Constants.kAppName;
    int value = (label.length * logoAnimator.value).round();
    return value;
  }

  String getLogoLiteral() {
    int end = getLogoLabelSubstringValue();
    return Constants.kAppName.substring(0, getLogoLabelSubstringValue()) +
        (end == Constants.kAppName.length ? '' : '_');
  }

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
                AnimatedBuilder(
                  animation: logoAnimator,
                  builder: (context, child) => Text(
                    getLogoLiteral(),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: spacing.s5! * 2),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.kPageName);
                },
                child: Text(
                  'Log In',
                  // ElevatedButton theme controls colors
                ),
                // use elevated button theme
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.kPageName);
                },
                child: Text(
                  'Register',
                  // use elevated button theme but prefer secondary color
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
