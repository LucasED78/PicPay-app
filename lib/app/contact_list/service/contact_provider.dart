import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';
import 'contact_service.dart';

class ContactProvider with ChangeNotifier{
  
  List<Contact> _contacts = [];
  List<Contact> _foundedContacts = [];
  Contact _contact;
  bool searching = false;

  void loadContacts() async{
    List<Contact> contacts = await ContactService().getAllContacts();
    _contacts = contacts;

    notifyListeners();
  }

  List<Contact> get contacts => _contacts;

  void searchContact(String term){
    print(term);
    if (term == '') searching = false;
    
    _foundedContacts = _contacts.where((c) => c.name.contains(term)).toList();
    searching = true;
    notifyListeners();
  }

  get foundedContacts => _foundedContacts;

  set selectedContact(Contact contact) {
    _contact = contact;
    notifyListeners();
  }
  get selectedContact => _contact;

}