import 'package:flutter/material.dart';

class DefaultFlatButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color textColor;
  final Color splashColor;
  final Function onPressed;

  DefaultFlatButton({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.textColor = Colors.white,
    this.splashColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      splashColor: splashColor,
      child: SizedBox(
        width: buttonWidth,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
