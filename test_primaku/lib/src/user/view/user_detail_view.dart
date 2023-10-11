import 'package:flutter/material.dart';
import 'package:test_primaku/src/user/model/user.dart';

class UserDetailView extends StatelessWidget {
  static const routeName = '/user-detail';
  final User user;
  const UserDetailView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (const Text('User Detail'))),
      body: SingleChildScrollView(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(75),
            child: Image.network(
              user.avatar ?? '',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Text('First Name : '),
              Text(user.firstName ?? ''),
            ],
          ),
          Row(
            children: [
              const Text('Last Name : '),
              Text(user.lastName ?? ''),
            ],
          ),
          Row(
            children: [
              const Text('email : '),
              Text(user.email ?? ''),
            ],
          )
        ]),
      ),
    );
  }
}
