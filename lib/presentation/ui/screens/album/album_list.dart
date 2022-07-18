import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/ui/screens/album/album_item.dart';
import 'package:flutter_exercise/presentation/ui/widgets/appbar.dart';

import '../../../../domain/entities/album_entity.dart';
import '../../../states/album/album_bloc.dart';
import '../../../states/album/album_event.dart';
import '../../../states/album/album_state.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  AlbumBloc get albumBloc => context.read<AlbumBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<AlbumBloc>().add(const AlbumLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: BlocBuilder<AlbumBloc, AlbumState>(
          builder: (_, state) {
            if (state.error != null) {
              return Text(state.error.toString());
            }
            return Column(
              children: [
                Expanded(child: createList(albumBloc.state.albums)),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget createList(List<AlbumEntity> albums) {
  return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return AlbumItem(albums[index]);
      });
}
