import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem();

  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 16),
      children: [
        Image.network('https://picsum.photos/250?image=1'),
        Image.network('https://picsum.photos/250?image=2'),
        Image.network('https://picsum.photos/250?image=3'),
      ],
    );
  }
}
