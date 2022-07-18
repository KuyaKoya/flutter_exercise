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
      ], //Action icon search as search icon, notification icon
      leading: Material(
        //Custom leading icon, such as back icon or other icon
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          splashColor: Colors.red[800],
        ),
      ),
    );
  }
}
