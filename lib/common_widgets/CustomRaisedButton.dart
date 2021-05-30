import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  CustomRaisedButton(
      {this.child, this.color, this.borderRadius, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        child: child,
        color: color,
        disabledColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        onPressed: onPressed,
      ),
    );
  }
}
