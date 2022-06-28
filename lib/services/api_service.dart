import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //ApiService._();
  static final api = ApiService();

  Future<void> createUser(User user) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    try {
      var response = await http.post(
        url,
        body: user.toMap(),
      );
      debugPrint(response.body);
    } on PlatformException catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<List<User>> getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    try {
      var response = await http.get(url);
      List json = jsonDecode(response.body);
      List<User> users = json.map((element) => User.fromMap(element)).toList();
      return users;
    } on PlatformException catch (error) {
      debugPrint("--> ${error.toString()}");
      return [];
    }
  }
}
