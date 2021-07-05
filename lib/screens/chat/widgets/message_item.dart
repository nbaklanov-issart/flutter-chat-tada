import 'package:flutter/material.dart';
import 'package:tada_chat/model/consts/style.dart';
import 'package:tada_chat/model/system/screen_dimensions.dart';

class MessageItem extends StatelessWidget {

  final String _text;
  final String _author;
  final String _dateString;
  final MainAxisAlignment _alignment;
  final Color _backColor;

  const MessageItem(
    this._text,
    this._author,
    this._dateString,
    this._alignment,
    this._backColor,
    { Key? key }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Row(
      mainAxisAlignment: _alignment,
      children: [
        Padding(
          padding: chatBubblePadding,
          child: Container(
            width: dimensions.width * 0.7,
            decoration: _buildItemDecoration(dimensions),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextColumn()
            )
          ),
        )
      ]
    );
  }

  BoxDecoration _buildItemDecoration(ScreenDimensions dimensions) {
    return BoxDecoration(
      color: _backColor,
      border: chatBubbleBorder,
      borderRadius: BorderRadius.circular(
        dimensions.withoutSafeAreaHeight * 0.01
      )
    );
  }

  Widget _buildTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(_author, style: messageSenderStyle, textAlign: TextAlign.left),
        Text(_text, style: messageTextStyle, textAlign: TextAlign.left),
        Text(_dateString, style: dateTextStyle, textAlign: TextAlign.right)
      ]
    );
  }
}