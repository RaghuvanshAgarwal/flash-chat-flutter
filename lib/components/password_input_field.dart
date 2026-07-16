import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  Function(String)? onChanged;
  PasswordInputField({required this.onChanged});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        prefixIcon: Icon(Icons.password),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        // rely on Theme's InputDecorationTheme for borders/padding
      ),
    );
  }
}
