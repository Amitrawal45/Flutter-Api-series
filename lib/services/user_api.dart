import 'dart:convert';
import 'package:flutter_api_series/model/user.dart';
// import 'package:flutter_api_series/model/user_dob.dart';
// import 'package:flutter_api_series/model/user_location.dart';
// import 'package:flutter_api_series/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    return users;
  }
}
