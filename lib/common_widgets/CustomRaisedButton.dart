import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  Key key;
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;

  CustomRaisedButton(
      {this.child, this.color, this.borderRadius:2.0, this.onPressed, this.height:50.0,this.key}):assert(borderRadius!=null),super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SizedBox(
      height: height,
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
