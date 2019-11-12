import 'package:flutter/material.dart';

class Transaction {
  int destinationId;
  double amount;

  Transaction({
    @required this.destinationId,
    @required this.amount
  });
}