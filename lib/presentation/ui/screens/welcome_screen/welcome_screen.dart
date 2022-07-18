import 'package:flutter/material.dart';
import 'package:flutter_exercise/presentation/ui/widgets/appbar.dart';
import 'package:flutter_exercise/presentation/ui/widgets/button.dart';
import 'package:flutter_exercise/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 235),
              Row(
                children: const [
                  SizedBox(width: 30),
                  Text(
                    'Be Part Of Something New,\nJoin Us Now',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              Row(
                children: const [
                  SizedBox(width: 30),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Tortor non vestibulum vitae.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ButtonComponent(
                backgroundColor: Colors.white,
                borderColor: Colors.blue,
                text: 'Create Account',
                textColor: Colors.blue,
                onTap: () {
                  AppNavigator.push(Routes.comments);
                },
              ),
              const SizedBox(height: 20),
              ButtonComponent(
                backgroundColor: Colors.blue,
                borderColor: Colors.transparent,
                text: 'Log In as Guest',
                textColor: Colors.white,
                onTap: () {
                  AppNavigator.push(Routes.posts);
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
