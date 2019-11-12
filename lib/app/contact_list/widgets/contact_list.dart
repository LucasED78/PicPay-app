import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';
import 'package:picpay_test/app/contact_list/service/contact_provider.dart';
import 'package:picpay_test/app/credit_card/credit_card_app.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {

  ContactList();

  @override
  Widget build(BuildContext context) {
    final ContactProvider _contactProvider = Provider.of(context);
    List<Contact> _contacts = [];

    if (_contactProvider.searching) _contacts = _contactProvider.foundedContacts;
    else _contacts = _contactProvider.contacts;

    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index){
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: ClipOval(
                child: Image.network(_contacts[index].image),
              ),
              title: Text(_contacts[index].username, style: Theme.of(context).textTheme.title,),
              subtitle: Text(_contacts[index].name, style: Theme.of(context).textTheme.subtitle,),
            ),
          ),
          onTap: (){
            _contactProvider.selectedContact = _contacts[index];
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => CreditCardApp()
            ));
          },
        );
      },
    );
  }
}