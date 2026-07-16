import 'package:flash_chat/components/email_input_field.dart';
import 'package:flash_chat/components/password_input_field.dart';
import 'package:flash_chat/components/rounded_rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/theme.dart';

class LoginScreen extends StatefulWidget {
  static const String kPageName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

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
            EmailInputField(
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: spacing.s2!),
            PasswordInputField(
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: spacing.s4!),
            RoundedRectangleButton(
              label: 'Log In',
              onPressed: () {
                print(email);
                print(password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
