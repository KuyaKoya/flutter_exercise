import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';

import 'package:flutter_exercise/presentation/ui/screens/post/post_item.dart';

import '../../../states/post/post_bloc.dart';
import '../../../states/post/post_event.dart';
import '../../../states/post/post_state.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  PostBloc get postBloc => context.read<PostBloc>();
   @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<PostBloc>().add(PostLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) {
        if (state.error != null) {
          return Text(state.error.toString());
        }
        return Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (var post in postBloc.state.posts) PostItem(post),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

