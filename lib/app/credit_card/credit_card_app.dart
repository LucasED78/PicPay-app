import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';
import 'package:picpay_test/app/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/app/credit_card/widgets/add_new_card.dart';
import 'package:picpay_test/app/credit_card/widgets/new_card.dart';
import 'package:picpay_test/app/transaction/transaction_app.dart';
import 'package:provider/provider.dart';

class CreditCardApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CreditCardProvider _creditCardProvider = Provider.of<CreditCardProvider>(context);

    if(_creditCardProvider.card == null){
      return NewCard();
    }
    else return TransactionApp();
  }
}