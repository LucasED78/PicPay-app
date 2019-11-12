import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/contact_app.dart';
import 'package:picpay_test/app/contact_list/service/contact_provider.dart';
import 'package:picpay_test/app/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/core/picpay_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CreditCardProvider>(
          builder: (_) => CreditCardProvider(),
        ),
        ChangeNotifierProvider<ContactProvider>(
          builder: (_) => ContactProvider(),
        )
      ],
      child: MaterialApp(
        theme: PicPayTheme.theme,
        home: PicPayApp()
      )
    ),
);

class PicPayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactApp(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}