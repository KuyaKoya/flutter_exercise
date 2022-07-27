import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_exercise/domain/entities/user/user_entity.dart';
import 'package:flutter_exercise/presentation/states/user/user_bloc.dart';
import 'package:flutter_exercise/presentation/states/user/user_event.dart';
import 'package:flutter_exercise/presentation/states/user/user_state.dart';
import 'package:flutter_exercise/presentation/ui/widgets/appbar.dart';
import 'package:flutter_exercise/presentation/ui/widgets/circular_progress_bar.dart';
import 'package:flutter_exercise/presentation/commons/routes.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserBloc get userBloc => context.read<UserBloc>();
  UserState userState = const UserState.initial();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<UserBloc>().add(const UserLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PlatformScaffold(
        appBar: CustomAppBar().appBar(false),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (_, state) {
            userState = state;
            if (state.status == UserStateStatus.loading) {
              return const LoadingData();
            }
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
                      ],
                    ),
                  ),
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
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () =>
                              _onAlbumButtonPressed(context, userState.user),
                          child: const Icon(Icons.photo_album),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
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

void _onAlbumButtonPressed(BuildContext context, UserEntity? user) {
  context.read<UserBloc>().add(UserSelectChanged(user: user));
  AppNavigator.push(Routes.albums);
}
