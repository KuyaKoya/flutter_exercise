import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/comment_entity.dart';

class CommentItem extends StatefulWidget {
  const CommentItem(this.comment, {Key? key}) : super(key: key);
  final CommentEntity comment;
  static const TextStyle _textStyle = TextStyle(fontSize: 16.0);
  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      widget.comment.email,
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 22, 97, 158),
                          fontSize: 14.0),
                      maxLines: 4,
                    ),
                    AutoSizeText(
                      widget.comment.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    AutoSizeText(
                      widget.comment.body,
                      style: CommentItem._textStyle,
                      maxLines: 4,
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
