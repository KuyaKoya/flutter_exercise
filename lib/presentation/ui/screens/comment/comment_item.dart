import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/comment_entity.dart';

class CommentItem extends StatefulWidget {
  const CommentItem(this.comment, {Key? key}) : super(key: key);
  final CommentEntity comment;
  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  widget.comment.name,
                  textAlign: TextAlign.start,
                  style: CommentItem._textStyle,
                ),
                AutoSizeText(
                  widget.comment.email,
                  style: CommentItem._textStyle,
                  maxLines: 4,
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
    );
  }
}
