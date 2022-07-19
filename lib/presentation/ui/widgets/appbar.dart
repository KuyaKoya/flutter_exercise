import 'package:flutter/material.dart';
import 'package:flutter_exercise/routes.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0, // for elevation
      titleSpacing: 0.0, // if you want remove title spacing with back button
      title: const Text('Fleeter'),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_rounded),
          onPressed: () {
            AppNavigator.push(Routes.users);
          },
        ),
      ],
    );
  }
}
