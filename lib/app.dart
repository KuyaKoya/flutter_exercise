import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/album/album_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/ui/screens/post/post_list.dart';
import 'package:flutter_exercise/presentation/ui/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter_exercise/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 37, 187, 247),
          useMaterial3: true),
      title: 'Fleeter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      home: const WelcomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
    return Scaffold(
      //  May God bless this scaffold.
      appBar: AppBar(
        title: const Text('Fleeter Demo App'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Flexible(child: PostList()),
        ],
      ),
    );
  }
}
