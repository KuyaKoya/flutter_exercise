import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/Request/user_request_data.dart';
import 'package:flutter_exercise/data/Response/user/user_response_data.dart';
import 'package:flutter_exercise/services/user_request.dart';

class UserContent extends StatefulWidget {
  const UserContent({Key? key}) : super(key: key);

  @override
  State<UserContent> createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {
  late Future<List<UserResponseData>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = UserRequest(UserRequestData()).getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 360,
          decoration: const BoxDecoration(color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "lib/assets/mipmap-hdpi/ic_fleeter_icon.png",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text('Name,'),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          "10",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
