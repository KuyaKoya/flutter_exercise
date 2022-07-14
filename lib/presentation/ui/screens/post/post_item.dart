import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 5, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        AutoSizeText(
                          'Name',
                          textAlign: TextAlign.start,
                          style: _textStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Expanded(
                          child: AutoSizeText(
                            'title',
                            style: _textStyle,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Expanded(
                          child: AutoSizeText(
                            'body',
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
          ],
        ),
      ),
    );
  }
}
