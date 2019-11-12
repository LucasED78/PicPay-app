import 'package:flutter/material.dart';

class PicPayScaffold extends StatelessWidget {
  final Widget body;

  PicPayScaffold({@required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: body,
    );
  }
}