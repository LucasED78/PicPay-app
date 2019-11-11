import 'package:flutter/material.dart';
import 'package:picpay_test/contact_list/model/contact.dart';
import 'package:picpay_test/contact_list/service/contact_service.dart';
import 'package:picpay_test/contact_list/widgets/contact_list.dart';
import 'package:picpay_test/contact_list/widgets/search_bar.dart';

class ContactApp extends StatefulWidget {
  @override
  _ContactAppState createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContactService().getAllContacts(),
      builder: (builder, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Text("carregando...");
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return Column(
              children: <Widget>[
                SearchBar(),
                Expanded(
                  child: ContactList(snapshot.data),
                )
              ],
            );
            break;
          default:
        }
      },
    );
  }
}