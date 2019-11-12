import 'package:flutter/material.dart';

class Contact {
  int id;
  String name;
  String image;
  String username;

  Contact({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.username
  });

  factory Contact.fromJSON(dynamic data){
    return Contact(
      id: data['id'],
      name: data['name'],
      image: data['img'],
      username: data['username']
    );
  }

  @override
  String toString() {
    super.toString();

    return "ID: $id, Name: $name, Image: $image, Username: $username /n";
  }
}