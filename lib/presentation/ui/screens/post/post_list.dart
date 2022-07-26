import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/post_entity.dart';
import '../../../states/post/post_bloc.dart';
import '../../../states/post/post_event.dart';
import '../../../states/post/post_state.dart';
import '../../widgets/appbar.dart';
import '../../widgets/circular_progress_bar.dart';
import 'post_item.dart';

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
        appBar: const CustomAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PostBloc, PostState>(
                builder: (_, state) {
                  if (state.status == PostStateStatus.loading) {
                    return const LoadingData();
                  }
                  if (state.error != null) {
                    return Text(state.error.toString());
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
