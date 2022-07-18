import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';

import 'package:flutter_exercise/presentation/ui/screens/post/post_item.dart';
import 'package:flutter_exercise/routes.dart';

import '../../../../domain/entities/post_entity.dart';
import '../../../states/post/post_bloc.dart';
import '../../../states/post/post_event.dart';
import '../../../states/post/post_state.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  // May God bless this code
  PostBloc get postBloc => context.read<PostBloc>();
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<PostBloc>().add(const PostLoadStarted(loadAll: true));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          elevation: 0,
          // add icons to scaffold
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_rounded),
              onPressed: () {
                AppNavigator.push(Routes.users);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PostBloc, PostState>(
                builder: (_, state) {
                  print(state.status.toString());
                  if (state.status == PostStateStatus.loading) {
                    return _buildLoading();
                  }
                  return Expanded(
                    child: createList(state.posts),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget createList(List<PostEntity> posts) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostItem(posts[index]);
      });
}

Widget _buildLoading() {
  return const Center(child: CircularProgressIndicator());
}
