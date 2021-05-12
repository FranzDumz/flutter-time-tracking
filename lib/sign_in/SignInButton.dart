import 'package:flutter/material.dart';
import 'package:udemy_app/common_widgets/customRaisedButton.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String imagepath,
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: const EdgeInsets.all(8.0),child: Image.asset(imagepath)),
              Text(text,
                  style: TextStyle(color: textColor, fontSize: 15.0)),
              Opacity(
                  opacity: 0.0, child: Image.asset(imagepath)),
            ],
          ),
          color: color,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
