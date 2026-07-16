import 'package:flash_chat/components/rounded_rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/theme.dart';

class RegistrationScreen extends StatefulWidget {
  static const String kPageName = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<AppSpacing>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing.s4!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(height: spacing.s5! * 2),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                // rely on Theme's InputDecorationTheme for borders/padding
              ),
            ),
            SizedBox(height: spacing.s2!),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
                // rely on Theme's InputDecorationTheme for borders/padding
              ),
            ),
            SizedBox(height: spacing.s4!),
            RoundedRectangleButton(label: 'Register', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
