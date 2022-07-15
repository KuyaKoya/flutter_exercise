import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/album/album_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/ui/screens/album/album_list.dart';

import 'presentation/states/themes/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostBloc get postBloc => context.read<PostBloc>();
  AlbumBloc get albumBloc => context.read<AlbumBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return Scaffold(
      //  May God bless this scaffold.
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("The theme is currently $isDark"),
          const Flexible(child: AlbumList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeCubit.toggleTheme();
        },
        tooltip: 'Toggle Theme',
        child: const Icon(Icons.wb_sunny_outlined),
      ),
    );
  }
}
