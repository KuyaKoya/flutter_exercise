import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/post_entity.dart';
import '../../../states/post/post_bloc.dart';
import '../../../states/post/post_event.dart';
import '../../../../routes.dart';

class PostItem extends StatefulWidget {
  const PostItem(this.post, {Key? key}) : super(key: key);
  final PostEntity post;

  static const TextStyle _textStyle = TextStyle(fontSize: 16);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
      child: Card(
        elevation: 6.0,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                          _onUserNamePressed(context, widget.post);
                        },
                        child: AutoSizeText(
                          widget.post.userName,
                          textAlign: TextAlign.start,
                          style: PostItem._textStyle,
                        ),
                      ),
                      AutoSizeText(
                        widget.post.title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        maxLines: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6.0, 6.0, 0, 12.0),
                        child: AutoSizeText(
                          widget.post.body,
                          style: PostItem._textStyle,
                          maxLines: 4,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0, 0.0),
                          child: OutlinedButton(
                              onPressed: () async {
                                _onCommentButtonPressed(context, widget.post);
                              },
                              child: const Text("COMMENTS"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onCommentButtonPressed(BuildContext context, PostEntity post) {
  context.read<PostBloc>().add(PostSelectChanged(post: post));
  AppNavigator.push(Routes.comments);
}

void _onUserNamePressed(BuildContext context, PostEntity post) {
  context.read<PostBloc>().add(PostSelectChanged(post: post));
  AppNavigator.push(Routes.users);
}
