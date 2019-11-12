import 'package:flutter/material.dart';
import 'package:picpay_test/contact_list/model/contact.dart';
import 'package:picpay_test/contact_list/service/contact_provider.dart';
import 'package:picpay_test/contact_list/service/contact_service.dart';
import 'package:picpay_test/contact_list/widgets/contact_list.dart';
import 'package:picpay_test/contact_list/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class ContactApp extends StatefulWidget {
  @override
  _ContactAppState createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactProvider>(
      builder: (context){
        return ContactProvider();
      },
      child: Builder(
        builder: (context){
          ContactProvider _contactProvider = Provider.of<ContactProvider>(context);
          _contactProvider.loadContacts();
          if (_contactProvider.contacts.isEmpty){
            return Center(
              child: Text("loading...", style: TextStyle(color: Colors.red),),
            );
          }
          else {
            return Column(
              children: <Widget>[
                SearchBar(),
                Expanded(
                  child: ContactList(),
                )
              ],
            );
          }
        },
      )
    );
  }
}