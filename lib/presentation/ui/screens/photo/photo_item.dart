import 'package:flutter/material.dart';
import '../../../../domain/entities/photo_entity.dart';

class PhotoItem extends StatefulWidget {
  const PhotoItem(this.photo, {Key? key}) : super(key: key);
  final PhotoEntity photo;

  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () => _showSimpleModalDialog(context, widget.photo),
        child: Hero(
          tag: 'ImageTag-${widget.photo.id}',
          child: Card(
            elevation: 6.0,
            child: Image.network(
              widget.photo.thumbnailUrl,
              fit: BoxFit.fill,
            ),
          ),
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
          child: Hero(
            tag: 'ImageTag-${photo.id}',
            child: Image.network(
              photo.url,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    },
  );
}
