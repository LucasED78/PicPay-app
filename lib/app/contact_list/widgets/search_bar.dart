import 'package:flutter/material.dart';
import 'package:picpay_test/app/contact_list/service/contact_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    ContactProvider _contactProvider = Provider.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          hintText: "A quem você vai pagar?",
          icon: Icon(Icons.search)
        ),
        style: TextStyle(
          color: Colors.white
        ),
        onChanged: (text){
          _contactProvider.searchContact(text);
        },
      ),
    );
  }
}