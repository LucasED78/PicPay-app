import 'package:flutter/material.dart';
import 'package:picpay_test/core/picpay_scaffold.dart';
import 'package:picpay_test/credit_card/model/credit_card.dart';
import 'package:picpay_test/credit_card/services/credit_card_provider.dart';
import 'package:picpay_test/credit_card/widgets/credit_card_button.dart';
import 'package:provider/provider.dart';

class AddNewCard extends StatelessWidget {
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _holder = TextEditingController();
  TextEditingController _expire = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  CreditCardProvider _creditCardProvider;

  @override
  Widget build(BuildContext context) {
    //  = Provider.of<CreditCardProvider>(context);
   
    void _addNewCard(){
      CreditCard newCard = CreditCard(
        cardNumber: _cardNumber.text,
        cvv: int.parse(_cvv.text),
        expireDate: _expire.text,
        holder: _holder.text
      );

      // _creditCardProvider.card = newCard;
      // print(_creditCardProvider.card);
    }

    return PicPayScaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text("Cadastrar cartão"),
            _buildTextField(context, "Número do Cartão", _cardNumber),
            _buildTextField(context, "Nome do titular", _holder),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildTextField(context, "Vencimento", _expire),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(context, "CVV", _cvv),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CreditCardButton(
                text: "Salvar",
                onPressed: _addNewCard,
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildTextField(BuildContext context, String label, TextEditingController controller){
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).accentColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor)
          ),
        ),
        controller: controller,
      ),
    );
  }
}