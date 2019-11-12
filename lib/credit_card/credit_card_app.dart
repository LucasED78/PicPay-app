import 'package:flutter/material.dart';
import 'package:picpay_test/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/credit_card/widgets/new_card.dart';
import 'package:provider/provider.dart';

class CreditCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreditCardProvider>(
      builder: (context){
        return CreditCardProvider();
      },
      child: NewCard(),
    );
  }
}