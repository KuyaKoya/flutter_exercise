import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';
import 'package:flutter_exercise/presentation/states/post/post_bloc.dart';
import 'package:flutter_exercise/presentation/states/post/post_event.dart';
import 'package:flutter_exercise/presentation/commons/routes.dart';

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
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white70,
                              minRadius: 20.0,
                              child: CircleAvatar(
                                radius: 10.0,
                                backgroundImage: NetworkImage(
                                    'https://www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png'),
                              ),
                            ),
                            AutoSizeText(
                              widget.post.userName,
                              textAlign: TextAlign.start,
                              style: PostItem._textStyle,
                            ),
                          ],
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
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            _onCommentButtonPressed(context, widget.post);
                          },
                          child: const AutoSizeText(
                            "COMMENTS",
                            maxLines: 1,
                          ),
                        ),
                      ),
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
