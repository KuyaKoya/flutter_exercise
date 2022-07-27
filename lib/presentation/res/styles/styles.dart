import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

final materialTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final cupertinoTheme = CupertinoThemeData(
  textTheme: const CupertinoTextThemeData(primaryColor: Colors.white),
  primaryColor: CupertinoDynamicColor.withBrightnessAndContrast(
      color: materialTheme.primaryColor,
      darkColor: materialTheme.primaryColorDark,
      darkHighContrastColor: materialTheme.primaryColorDark,
      highContrastColor: materialTheme.primaryColor),
);

final materialElevatedButtonData = MaterialElevatedButtonData(
  style: ElevatedButton.styleFrom(
    primary: materialTheme.primaryColor,
    textStyle: const TextStyle(color: Colors.white),
  ),
);

final cupertinoElevatedButtonData = CupertinoElevatedButtonData(
  minSize: 50,
  padding: const EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 0),
);

final materialBarData =
    MaterialAppBarData(systemOverlayStyle: SystemUiOverlayStyle.dark);

final cupertinoBarData = CupertinoNavigationBarData(
  backgroundColor: materialTheme.primaryColor,
  brightness: Brightness.dark,
);
