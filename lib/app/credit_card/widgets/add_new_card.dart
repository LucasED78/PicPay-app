import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:picpay_test/app/transaction/transaction_app.dart';
import 'package:picpay_test/core/picpay_scaffold.dart';
import 'package:picpay_test/app/credit_card/model/credit_card.dart';
import 'package:picpay_test/app/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/core/picpay_theme.dart';
import 'package:picpay_test/core/widgets/common_button.dart';
import 'package:provider/provider.dart';

class AddNewCard extends StatefulWidget {
  @override
  AddNewCardState createState() => AddNewCardState();
}

class AddNewCardState extends State<AddNewCard> {
  final MaskedTextController _cardNumber = MaskedTextController(mask: "0000-0000-0000-0000");
  final TextEditingController _holder = TextEditingController();
  final MaskedTextController _expire = MaskedTextController(mask: "00/00");
  final MaskedTextController _cvv = MaskedTextController(mask: "000");
  CreditCardProvider _creditCardProvider;

  @override
  Widget build(BuildContext context) {
    _creditCardProvider = Provider.of<CreditCardProvider>(context);

    void _addNewCard(){
      CreditCard newCard = CreditCard(
        cardNumber: _cardNumber.text,
        cvv: int.parse(_cvv.text),
        expireDate: _expire.text,
        holder: _holder.text
      );

       _creditCardProvider.card = newCard;

       Navigator.push(context, MaterialPageRoute(
         builder: (_) => TransactionApp()
       ));
    }

    return PicPayScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text("Cadastrar cartão"),
              _buildTextField(context, "Número do Cartão", _cardNumber, inputType: TextInputType.number),
              _buildTextField(context, "Nome do titular", _holder),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _buildTextField(context, "Vencimento", _expire, inputType: TextInputType.datetime),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(context, "CVV", _cvv, inputType: TextInputType.number),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: CommonButton(
                  text: "Salvar",
                  onPressed: _addNewCard,
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _buildTextField(BuildContext context, String label, TextEditingController controller,
      {TextInputType inputType}){
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: PicPayTheme.theme.textTheme.title,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).accentColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor)
          ),
        ),
        controller: controller,
        keyboardType: inputType ?? TextInputType.text,
      ),
    );
  }
}