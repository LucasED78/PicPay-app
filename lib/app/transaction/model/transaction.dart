import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';

class Transaction {
  int id;
  Contact contact;
  double amount;
  DateTime completedAt;
  String status;


  Transaction({
    @required this.contact,
    @required this.amount,
    this.completedAt,
    this.id,
    this.status
  });

  factory Transaction.fromJSON(dynamic data){
    return Transaction(
      id: data['transaction']['id'],
      amount: data['transaction']['value'],
      contact: Contact.fromJSON(data['transaction']['destination_user']),
      completedAt: DateTime.fromMillisecondsSinceEpoch(data['transaction']['timestamp']),
      status: data['transaction']['status']
    );
  }
}