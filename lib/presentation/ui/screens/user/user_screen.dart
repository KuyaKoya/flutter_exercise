import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_exercise/presentation/states/user/user_bloc.dart';
import 'package:flutter_exercise/presentation/states/user/user_event.dart';
import 'package:flutter_exercise/presentation/states/user/user_state.dart';
import 'package:flutter_exercise/presentation/ui/widgets/appbar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserBloc get userBloc => context.read<UserBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<UserBloc>().add(const UserLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state.error != null) {
            return Text(state.error.toString());
          }

          return Center(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blue.shade200],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.5, 0.9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            minRadius: 60.0,
                            child: CircleAvatar(
                              radius: 55.0,
                              backgroundImage: NetworkImage(
                                  'https://www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.user?.username ?? '',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                createPostAlbumCount(),
                Column(
                  children: <Widget>[
                    createInfoTile('Email', state.user?.username ?? ''),
                    const Divider(),
                    createInfoTile('Company', state.user?.company.name ?? ''),
                    const Divider(),
                    createInfoTile('Phone', state.user?.phone ?? ''),
                    const Divider(),
                    createInfoTile('Website', state.user?.website ?? ''),
                  ],
                )
              ],
            ),
          );
        },
      ),
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

Widget createPostAlbumCount() {
  return Row(children: <Widget>[
    Expanded(
      child: Container(
        color: Colors.blueAccent.shade200,
        child: const ListTile(
          title: Text(
            '5000',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Posts',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        color: Colors.blueAccent.shade200,
        child: const ListTile(
          title: Text(
            '5000',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Albums',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    ),
  ]);
}
