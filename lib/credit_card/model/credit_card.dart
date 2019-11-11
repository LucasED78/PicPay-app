import 'package:flutter/material.dart';

class CreditCard {
  String cardNumber;
  double value;
  int cvv;
  String expireDate;

  CreditCard({
    @required this.cardNumber,
    @required this.value,
    @required this.cvv,
    @required this.expireDate
  });
}