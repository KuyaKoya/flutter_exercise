import 'package:flutter/material.dart';
import 'package:flutter_exercise/presentation/ui/screens/splash/splash.dart';
import 'package:flutter_exercise/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 37, 187, 247),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
