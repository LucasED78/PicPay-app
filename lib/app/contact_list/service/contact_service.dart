import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';

class ContactService{

  Future<List> getAllContacts() async{
    Response response = await Dio().get("http://careers.picpay.com/tests/mobdev/users");
    
    List<Contact> contacts = json.decode(response.data).map<Contact>((data){
      return Contact.fromJSON(data);
    }).toList();

    return contacts;
  }
  
}