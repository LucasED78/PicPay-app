import 'package:flutter/cupertino.dart';
import 'package:picpay_test/app/contact_list/model/contact.dart';
import 'package:picpay_test/core/picpay_theme.dart';

class ContactSelected extends StatelessWidget {
  final Contact _contact;

  ContactSelected(this._contact);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ClipOval(
            child: Image.network(this._contact.image),
          ),
        ),
        Text(this._contact.username, style: PicPayTheme.theme.textTheme.title)
      ],
    );
  }
}
