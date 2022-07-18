import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/album/album_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/ui/screens/post/post_list.dart';
import 'package:flutter_exercise/presentation/ui/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter_exercise/routes.dart';

import 'presentation/states/themes/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 37, 187, 247), useMaterial3: true),
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
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return Scaffold(
      //  May God bless this scaffold.
      appBar: AppBar(
        title: const Text('Fleeter Demo App'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("The theme is currently $isDark"),
          const Flexible(child: PostList()),
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
