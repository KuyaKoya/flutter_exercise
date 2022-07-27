import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/domain/entities/photo_entity.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
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
    builder: (_) => PlatformWidget(
      material: (_, __) => _materialPopupContent(photo),
      cupertino: (_, __) => _cupertinoPopupContent(photo),
    ),
  );
}

Dialog _materialPopupContent(PhotoEntity photo) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
}

CupertinoAlertDialog _cupertinoPopupContent(PhotoEntity photo) {
  return CupertinoAlertDialog(
    content: Image.network(
      photo.url,
      fit: BoxFit.fill,
    ),
  );
}
