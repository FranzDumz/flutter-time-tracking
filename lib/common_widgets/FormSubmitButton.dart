

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_app/common_widgets/CustomRaisedButton.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    @required VoidCallback onPressed,
  }) :super(
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20.0),),
      color: Colors.brown[700],
      borderRadius: 4.0,
      onPressed: onPressed
  );
}