import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/presentation/states/comment/comment_bloc.dart';
import 'package:flutter_exercise/presentation/states/comment/comment_state.dart';
import 'package:flutter_exercise/presentation/ui/screens/comment/comment_item.dart';
import 'package:flutter_exercise/presentation/ui/widgets/appbar.dart';
import 'package:flutter_exercise/presentation/ui/widgets/circular_progress_bar.dart';
import '../../../../domain/entities/comment_entity.dart';
import '../../../states/comment/comment_event.dart';

class CommentList extends StatefulWidget {
  const CommentList({Key? key}) : super(key: key);

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  // May God bless this code
  CommentBloc get commentBloc => context.read<CommentBloc>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    scheduleMicrotask(() {
      context.read<CommentBloc>().add(const CommentLoadStarted(loadAll: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (_, state) {
            if (state.status == CommentStateStatus.loading) {
              return const LoadingData();
            }
            if (state.error != null) {
              return Text(state.error.toString());
            }
            return Container(
              child: createList(state.comments),
            );
          },
        ),
      ),
    );
  }
}

Widget createList(List<CommentEntity> comments) {
  return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return CommentItem(comments[index]);
      });
}

Widget _buildLoading() {
  return const Center(child: CircularProgressIndicator());
}
