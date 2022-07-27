import 'package:flutter/cupertino.dart';
import 'package:flutter_exercise/presentation/commons/routes.dart';
import 'package:flutter_exercise/presentation/res/styles/styles.dart';
import 'package:flutter_exercise/presentation/ui/screens/splash/splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (BuildContext context) => PlatformApp(
        title: 'Fleeter',
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
        material: (_, __) => MaterialAppData(
            theme: materialTheme, debugShowCheckedModeBanner: false),
        cupertino: (_, __) => CupertinoAppData(
            theme: cupertinoTheme, debugShowCheckedModeBanner: false),
        home: const SplashScreen(),
      ),
    );
  }
}
