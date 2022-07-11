import 'package:flutter/material.dart';
import 'package:flutter_exercise/screens/posts/post_screen.dart';
import 'package:flutter_exercise/screens/users/user_details.w.dart';

import '../../data/post/post.dart';
import '../../services/post_request.dart';
import '../albums/album_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  late Future<List<Post>> futurePost;
  @override
  void initState() {
    super.initState();
    futurePost = PostRequest().getPosts();
  }

  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    PostScreen(),
    AlbumScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fleeter'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const UserDetails(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                widgetOptions.elementAt(selectedIndex),
              ],
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Posts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.photo_album),
                label: 'Albums',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.red[800],
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
