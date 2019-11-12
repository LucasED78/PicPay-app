import 'package:flutter/material.dart';

class PicPayTheme {
  static get theme {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Color.fromRGBO(17, 199, 111, 1),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Color.fromRGBO(17, 199, 111, 1),)
      ),
      buttonColor: Color.fromRGBO(17, 199, 111, 1),
      textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
          subtitle: TextStyle(color: Colors.grey),
          button: TextStyle(
            color: Color.fromRGBO(17, 199, 111, 1),
          ),
          display1: TextStyle(color: Colors.white, fontSize: 25)
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.white,
        labelStyle: TextStyle(color: Colors.grey),
      ),
      hintColor: Colors.grey,
    );
  }
}