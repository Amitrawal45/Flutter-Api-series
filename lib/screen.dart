import 'package:flutter/material.dart';
import 'package:flutter_api_series/model/user.dart';
import 'package:flutter_api_series/services/user_api.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch the data"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          final color = user.gender == 'male' ? Colors.yellow : Colors.green;

          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.location.state),
            tileColor: color,
          );
        },
      ),
    );
  }

  void fetchUser() async {
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
  }
}
