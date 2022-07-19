import 'package:flutter/material.dart';
import 'package:flutter_exercise/domain/entities/photo_entity.dart';

class PhotoItem extends StatefulWidget {
  const PhotoItem(this.photo, {Key? key}) : super(key: key);
  final PhotoEntity photo;

  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showSimpleModalDialog(context, widget.photo),
      child: Card(
        elevation: 6.0,
        child: Image.network(
          widget.photo.thumbnailUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

void _showSimpleModalDialog(context, PhotoEntity photo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 350),
          child: Image.network(
            photo.url,
            fit: BoxFit.fill,
          ),
        ),
      );
    },
  );
}
