import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/presentation/commons/routes.dart';
import 'package:flutter_exercise/presentation/res/styles/styles.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomAppBar {
  PlatformAppBar appBar(bool postScreen) {
    return PlatformAppBar(
      title: const Text(
        'Fleeter',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      trailingActions: [
        if (!postScreen)
          PlatformIconButton(
            onPressed: () => AppNavigator.replaceWith(Routes.posts),
            materialIcon: const Icon(Icons.home),
            cupertinoIcon: const Icon(
              CupertinoIcons.home,
              size: 28.0,
            ),
          ),
      ],
      material: (_, __) => materialBarData,
      cupertino: (_, __) => cupertinoBarData,
    );
  }
}
