import 'package:flash_chat/components/email_input_field.dart';
import 'package:flash_chat/components/password_input_field.dart';
import 'package:flash_chat/components/rounded_rectangle_button.dart';
import 'package:flash_chat/controllers/registration_screen_controller.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/theme.dart';

class RegistrationScreen extends StatefulWidget {
  static const String kPageName = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final RegistrationScreenController controller;

  @override
  void initState() {
    controller = RegistrationScreenController();
    super.initState();
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
                controller.email = value;
              },
            ),
            SizedBox(height: spacing.s2!),
            PasswordInputField(
              onChanged: (value) {
                controller.password = value;
              },
            ),
            SizedBox(height: spacing.s4!),
            RoundedRectangleButton(
              label: 'Register',
              onPressed: () async {
                bool success = await controller.register(context);
                if (success) {
                  Navigator.pushNamed(context, ChatScreen.kPageName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
