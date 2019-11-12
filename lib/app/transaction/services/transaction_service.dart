import 'package:dio/dio.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';
import 'dart:convert';
import 'dart:async';

import 'package:picpay_test/app/credit_card/model/credit_card.dart';
import 'package:picpay_test/app/transaction/model/transaction.dart';

class TransactionService {

  Future payContact(Contact contact, CreditCard creditCard, Transaction transaction) async{
    Response response = await Dio().post("http://careers.picpay.com/tests/mobdev/transaction",
      data: {
        "card_number": creditCard.cardNumber,
        "cvv": creditCard.cvv,
        "value": transaction.amount,
        "expiry_date": creditCard.expireDate,
        "destination_user_id": contact.id
      }
    );

    return response.data;
  }

}