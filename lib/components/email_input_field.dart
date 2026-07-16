import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  Function(String)? onChanged;
  EmailInputField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        prefixIcon: Icon(Icons.email),
        // rely on Theme's InputDecorationTheme for borders/padding
      ),
    );
  }
}
