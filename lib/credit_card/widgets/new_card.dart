import 'package:flutter/material.dart';
import 'package:picpay_test/core/picpay_scaffold.dart';
import 'package:picpay_test/credit_card/widgets/add_new_card.dart';
import 'package:picpay_test/credit_card/widgets/credit_card_button.dart';

class NewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PicPayScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Cadastre um cartão de crédito",
            style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Para fazer pagamentos para outras pessoas você precisa cadastrar um cartão de crédito pessoal.",
              style: TextStyle(color: Colors.grey, fontSize: 20), textAlign: TextAlign.center,
          ),
          CreditCardButton(text: "Cadastrar cartão", onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddNewCard()
            ));
          })
        ],
      ),
    );
  }
}