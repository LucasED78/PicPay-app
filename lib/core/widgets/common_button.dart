import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final String text;

  CommonButton({
    @required this.onPressed,
    @required this.text,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        color: color ?? Theme.of(context).buttonColor,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: onPressed,
      ),
    );
  }
}
