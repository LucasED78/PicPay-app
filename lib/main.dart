import 'package:flutter/material.dart';
import 'package:picpay_test/contact_list/contact_app.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Color.fromRGBO(17, 199, 111, 1),
      textTheme: TextTheme(
        title: TextStyle(color: Colors.white),
        subtitle: TextStyle(color: Colors.grey)
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.white,
        labelStyle: TextStyle(color: Colors.grey),
      ),
      hintColor: Colors.grey,
    ),
    home: PicPayApp(),
  )
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