import 'package:flutter/material.dart';

class CreditCardButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  CreditCardButton({
    @required this.text,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      child: RaisedButton(
        child: Text(text, style: Theme.of(context).textTheme.title),
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: onPressed,
      ),
    );
  }
}