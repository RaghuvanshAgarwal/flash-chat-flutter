import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

void showAlert(BuildContext context, String title, String description) {
  showPlatformDialog(
    context: context,
    builder: (context) => BasicDialogAlert(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        BasicDialogAction(
          title: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
