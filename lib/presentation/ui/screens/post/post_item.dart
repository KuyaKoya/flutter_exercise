import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/domain/entities/post_entity.dart';

class PostItem extends StatelessWidget {
  const PostItem(this.post, {Key? key}) : super(key: key);
  final PostEntity post;

  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

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
                  AutoSizeText(
                      post.userName,
                      textAlign: TextAlign.start,
                      style: _textStyle,
                    ),
                  AutoSizeText(
                            post.title,
                            style: _textStyle,
                            maxLines: 4,
                    ),
                  AutoSizeText(
                      post.body,
                      style: _textStyle,
                      maxLines: 4,
                    ),
                  const ElevatedButton(
                    onPressed: _onCommentButtonPressed, 
                    child: Text("Comment")
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _onCommentButtonPressed() {
  
}