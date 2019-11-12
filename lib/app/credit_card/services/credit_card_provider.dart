import 'package:flutter/material.dart';
import 'package:picpay_test/app/credit_card/model/credit_card.dart';

class CreditCardProvider with ChangeNotifier {

  CreditCard _card;

  set card(CreditCard card){
    _card = card;
    notifyListeners();
  }

  get card => _card;

}