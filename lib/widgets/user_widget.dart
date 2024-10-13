import 'package:flutter/material.dart';
import '../models/user.dart';

class UserWidget extends StatelessWidget {
  final User user;

  const UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(user.name[0]),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        onTap: () {
          // Action lors du clic sur un utilisateur
        },
      ),
    );
  }
}
