import 'package:flutter/material.dart';
import 'package:flutter_exercise/data/post/post.dart';
import 'album_item.w.dart';

class AlbumList extends StatelessWidget {
  const AlbumList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        AlbumItem(),
      ],
    );
  }
}
