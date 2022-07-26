import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_item.dart';
import '../../widgets/appbar.dart';
import '../../widgets/circular_progress_bar.dart';

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
            if (state.status == AlbumStateStatus.loading) {
              return const LoadingData();
            }
            if (state.error != null) {
              return Text(state.error.toString());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: createList(albumBloc.state.albums)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget createList(List<AlbumEntity> albums) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: albums.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: AlbumItem(albums[index]),
        );
      });
}
