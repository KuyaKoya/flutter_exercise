import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_event.dart';
import 'package:flutter_exercise/routes.dart';

class PostItem extends StatefulWidget {
  const PostItem(this.post, {Key? key}) : super(key: key);
  final PostEntity post;

  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      _onUserNamePressed(widget.post);
                    },
                    child: AutoSizeText(
                      widget.post.userName,
                      textAlign: TextAlign.start,
                      style: PostItem._textStyle,
                    ),
                  ),
                  AutoSizeText(
                    widget.post.title,
                    style: PostItem._textStyle,
                    maxLines: 4,
                  ),
                  AutoSizeText(
                    widget.post.body,
                    style: PostItem._textStyle,
                    maxLines: 4,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        _onCommentButtonPressed(context, widget.post);
                      },
                      child: Text("Comment"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _onCommentButtonPressed(BuildContext context, PostEntity post) {
  context.read<PostBloc>().add(PostSelectChanged(post: post));
  AppNavigator.push(Routes.comments);
}

void _onUserNamePressed(PostEntity post) {
  debugPrint("pressed");
  AppNavigator.push(Routes.users);
}
