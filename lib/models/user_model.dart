import 'package:consuming_api/models/address_model.dart';

class User {
  int? id;
  String? username;
  String? email;
  String? phone;
  //Address? address;

  User({
    this.id,
    this.email,
    this.username,
    this.phone,
    //this.address,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      id: user['id'],
      username: user['username'],
      email: user['email'],
      phone: user['phone'],
      //address: user['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      //'address': address,
    };
  }
}
