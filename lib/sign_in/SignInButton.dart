import 'package:flutter/material.dart';
import 'package:udemy_app/common_widgets/CustomRaisedButton.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    Key key,
    @required String imagepath,
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) :assert(text!=null),
        super(
         key:key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imagepath)),
              Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
              Opacity(opacity: 0.0, child: Image.asset(imagepath)),
            ],
          ),
          color: color,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
