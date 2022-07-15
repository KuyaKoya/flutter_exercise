import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_event.dart';
import 'package:flutter_exercise/presentation/states/user/user_bloc.dart';
import 'package:flutter_exercise/presentation/states/user/user_event.dart';
import 'package:flutter_exercise/presentation/states/user/user_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        if (state.error != null) {
          return Text(state.error.toString());
        }

        return Scaffold(
          body: ListView(
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
                    const Text(
                      'John Smith',
                      style: TextStyle(
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
              Column(
                children: <Widget>[
                  createInfoTile('Email', 'john.smith@mllrdev.com'),
                  const Divider(),
                  createInfoTile('Company', 'Romaguera-Crona'),
                  const Divider(),
                  createInfoTile('Phone', '92998-3874'),
                  const Divider(),
                  createInfoTile('Website', 'hildegard.org'),
                ],
              )
            ],
          ),
        );
      },
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
