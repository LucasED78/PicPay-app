import 'package:flutter/material.dart';
import 'package:picpay_test/contact_list/model/contact.dart';

class ContactList extends StatelessWidget {

  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: ClipOval(
              child: Image.network(_contacts[index].image),
            ),
            title: Text(_contacts[index].username, style: Theme.of(context).textTheme.title,),
            subtitle: Text(_contacts[index].name, style: Theme.of(context).textTheme.subtitle,),
          ),
        );
      },
    );
  }
}