import 'package:flutter/material.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';

class UserDetails extends StatefulWidget {
  const UserDetails(this.user, {Key? key}) : super(key: key);
  final UserEntity? user;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        createInfoTile('Email', widget.user?.username),
        const Divider(),
        createInfoTile('Company', widget.user?.company.name),
        const Divider(),
        createInfoTile('Phone', widget.user?.phone),
        const Divider(),
        createInfoTile('Website', widget.user?.website),
      ],
    );
  }
}

Widget createInfoTile(title, subTitle) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      subTitle,
      style: const TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
