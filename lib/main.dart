import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'presentation/stores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

class _MyHomePageState extends State<MyHomePage>
    with StoreWatcherMixin<MyHomePage> {
  late PostStore store;

  @override
  void initState() {
    super.initState();
    store = listenToStore(postStoreToken) as PostStore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              loadPostsAction.call();
            },
            child: const Text('Get Post'),
          ),
        ],
      ),
      body: ListView(
        children: store.posts.map((post) => PostWidget(post)).toList(),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget(this.post);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 10.0),
      ),
      child: Card(
        elevation: 10.0,
        color: Colors.lightBlue,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(post.postTitle),
                leading: const CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person),
                ),
                subtitle: Text(post.postBody),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
