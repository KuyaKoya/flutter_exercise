import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/photo_entity.dart';
import '../../../states/photos/photo_bloc.dart';
import '../../../states/photos/photo_event.dart';
import '../../../states/photos/photo_state.dart';
import 'photo_item.dart';

import '../../widgets/appbar.dart';
import '../../widgets/circular_progress_bar.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({Key? key}) : super(key: key);
  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  PhotoBloc get photoBloc => context.read<PhotoBloc>();
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<PhotoBloc>().add(const PhotoLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (_, state) {
            if (state.error != null) {
              return Text(state.error.toString());
            }
            if (state.status == PhotoStateStatus.loading) {
              return const LoadingData();
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: createList(photoBloc.state.photos)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget createList(List<PhotoEntity> photos) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: photos.length,
      itemBuilder: (BuildContext context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: PhotoItem(photos[index]),
        );
      });
}
