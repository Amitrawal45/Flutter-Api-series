import 'package:flutter_api_series/model/user_dob.dart';
import 'package:flutter_api_series/model/user_location.dart';
import 'package:flutter_api_series/model/user_name.dart';
import 'package:flutter_api_series/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserLocation location;

  final UserPicture picture;

  final UserDob dob;

  User(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.dob,
      required this.location,
      required this.picture});

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      title: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
    final picture = UserPicture.fromMap(e['picture']);

    final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString());
    final date = e['dob']['date'];
    final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));
    return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
        dob: dob,
        picture: picture,
        location: location);
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
