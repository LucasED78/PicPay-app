import 'package:flutter/material.dart';

class CreditCard {
  String cardNumber;
  String holder;
  int cvv;
  String expireDate;

  CreditCard({
    @required this.cardNumber,
    @required this.holder,
    @required this.cvv,
    @required this.expireDate
  });
}