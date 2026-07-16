import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final ButtonStyle? buttonStyle;

  const RoundedRectangleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          // use elevated button theme but prefer secondary color
        ),
        style: buttonStyle,
      ),
    );
  }
}
