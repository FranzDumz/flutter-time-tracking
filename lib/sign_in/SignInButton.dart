import 'package:flutter/material.dart';
import 'package:udemy_app/common_widgets/customRaisedButton.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
          color: color,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
