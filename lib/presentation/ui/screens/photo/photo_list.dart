import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';

import 'package:flutter_exercise/presentation/ui/screens/post/post_item.dart';

import '../../../../domain/entities/post_entity.dart';
import '../../../states/post/post_bloc.dart';
import '../../../states/post/post_event.dart';
import '../../../states/post/post_state.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({Key? key}) : super(key: key);
  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) {
        if (state.error != null) {
          return Text(state.error.toString());
        }
        return Column(
          children: const [
            Expanded(
              child: Text("photo"),
            ),
          ],
        );
      },
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
