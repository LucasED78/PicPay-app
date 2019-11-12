import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/service/contact_provider.dart';
import 'package:picpay_test/app/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/app/transaction/model/transaction.dart';
import 'package:picpay_test/app/transaction/services/transaction_service.dart';
import 'package:picpay_test/app/transaction/widgets/contact_selected.dart';
import 'package:picpay_test/core/picpay_scaffold.dart';
import 'package:picpay_test/core/picpay_theme.dart';
import 'package:picpay_test/core/widgets/common_button.dart';
import 'package:provider/provider.dart';

class TransactionPayment extends StatefulWidget {

  @override
  _TransactionPaymentState createState() => _TransactionPaymentState();
}

class _TransactionPaymentState extends State<TransactionPayment> {
  TextEditingController _amountController = TextEditingController();
  Color buttonColor;

  @override
  Widget build(BuildContext context) {
    CreditCardProvider _creditCardProvider = Provider.of<CreditCardProvider>(context);
    ContactProvider _contactProvider = Provider.of<ContactProvider>(context);


    return PicPayScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ContactSelected(_contactProvider.selectedContact),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).accentColor, fontSize: 50,
            decoration: TextDecoration.none
          ),
            decoration: InputDecoration(
              hintText: "10,00",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 50
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text){
              if (text.isEmpty) buttonColor = Colors.grey;
              else buttonColor = PicPayTheme.theme.buttonColor;
            },
            controller: _amountController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("teste - ", style: TextStyle(color: Colors.white),),
              FlatButton(
                child: Text("EDITAR", style: PicPayTheme.theme.textTheme.button),
                onPressed: () => {},
              )
            ],
          ),
          CommonButton(
            color: buttonColor,
            text: "Pagar",
            onPressed: () async{
              Transaction _transaction = Transaction(
                  amount: double.parse(_amountController.text),
                  destinationId: _contactProvider.selectedContact.id
              );

              print(await TransactionService().payContact(
                  _contactProvider.selectedContact,
                  _creditCardProvider.card,
                  _transaction
              ));

            },
          )
        ],
      ),
    );
  }
}
