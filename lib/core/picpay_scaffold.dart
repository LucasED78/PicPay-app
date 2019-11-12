import 'package:flutter/material.dart';
import 'package:picpay_test/core/picpay_theme.dart';

class PicPayScaffold extends StatelessWidget {
  final Widget body;

  PicPayScaffold({@required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: PicPayTheme.theme.accentColor)
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: body,
    );
  }
}