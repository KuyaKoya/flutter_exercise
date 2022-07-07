import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PostItem extends StatelessWidget {
  const PostItem(this.postTitle, this.postBody);

  final String postTitle;
  final String postBody;

  static const TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: AutoSizeText(
                            postTitle,
                            style: _textStyle,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 10, 10, 10),
                          child: AutoSizeText(
                            postBody,
                            style: _textStyle,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
