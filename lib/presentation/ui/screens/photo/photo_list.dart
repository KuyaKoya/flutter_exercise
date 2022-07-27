import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/domain/entities/photo_entity.dart';
import 'package:flutter_exercise/presentation/states/photos/photo_bloc.dart';
import 'package:flutter_exercise/presentation/states/photos/photo_event.dart';
import 'package:flutter_exercise/presentation/states/photos/photo_state.dart';
import 'package:flutter_exercise/presentation/ui/screens/photo/photo_item.dart';

import 'package:flutter_exercise/presentation/ui/widgets/appbar.dart';
import 'package:flutter_exercise/presentation/ui/widgets/circular_progress_bar.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
    return SafeArea(
      child: PlatformScaffold(
        appBar: CustomAppBar().appBar(false),
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
