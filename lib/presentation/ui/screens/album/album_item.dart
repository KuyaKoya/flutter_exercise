import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/domain/entities/album_entity.dart';
import 'package:flutter_exercise/presentation/states/album/album_bloc.dart';
import 'package:flutter_exercise/presentation/states/album/album_event.dart';
import 'package:flutter_exercise/presentation/commons/routes.dart';

class AlbumItem extends StatefulWidget {
  const AlbumItem(this.album, {Key? key}) : super(key: key);
  final AlbumEntity album;

  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  State<AlbumItem> createState() => _AlbumItemState();
}

class _AlbumItemState extends State<AlbumItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: InkWell(
          onTap: () => _onAlbumPressed(context, widget.album),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        widget.album.title,
                        textAlign: TextAlign.center,
                        style: AlbumItem._textStyle,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _onAlbumPressed(BuildContext context, AlbumEntity album) {
  context.read<AlbumBloc>().add(AlbumSelectChanged(album: album));
  AppNavigator.push(Routes.photos);
}
