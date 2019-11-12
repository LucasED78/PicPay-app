import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:picpay_test/app/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/app/transaction/model/transaction.dart';
import 'package:picpay_test/app/transaction/widgets/contact_selected.dart';
import 'package:picpay_test/core/picpay_theme.dart';
import 'package:provider/provider.dart';


class PaymentConfirmed extends StatelessWidget {

  final Transaction _transaction;

  PaymentConfirmed(this._transaction);

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider = Provider.of<CreditCardProvider>(context);

    return Container(
      color: Colors.black87,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _buildText("Recibo", PicPayTheme.theme.textTheme.display1),
              ContactSelected(_transaction.contact),
              _buildText(
                DateFormat("dd/MM/yyyy").format(_transaction.completedAt),
                PicPayTheme.theme.textTheme.subtitle,
              ),
              _buildText(
                "Transação: ${_transaction.id}",
                PicPayTheme.theme.textTheme.subtitle,
              ),
              Center(
                child: Container(
                  width: 300,
                  child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.grey),
                                  bottom: BorderSide(color: Colors.grey)
                              )
                          ),
                          child: _buildRow([
                            Text(
                                "Cartão: ${_creditCardProvider.card.cardNumber}",
                                style: PicPayTheme.theme.textTheme.title
                            ),
                            Text(
                                "R\$ ${_transaction.amount}",
                                style: PicPayTheme.theme.textTheme.title
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: _buildRow([
                            Text(
                              "Total pago",
                              style: PicPayTheme.theme.textTheme.display1,
                            ),
                            Text(
                              "R\$ ${_transaction.amount}",
                              style: PicPayTheme.theme.textTheme.display1,
                            ),
                          ]),
                        )
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> widget){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget,
    );
  }

  Widget _buildText(String text, TextStyle style){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
