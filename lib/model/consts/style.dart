import 'package:flutter/material.dart';
import 'package:tada_chat/model/consts/colors.dart';

const TextStyle messageSenderStyle = TextStyle(
  color: messageSenderTextColor,
  fontWeight: FontWeight.bold
);

const TextStyle messageTextStyle = TextStyle(
  color: messageTextColor,
  fontWeight: FontWeight.normal
);

const TextStyle dateTextStyle = TextStyle(
  color: messageTextColor,
  fontWeight: FontWeight.normal
);

const EdgeInsets chatBubblePadding = const EdgeInsets.all(8.0);
const BorderSide chatBubbleSide = BorderSide(
  color: chatBorderColor,
  width: 2.0
);
const Border chatBubbleBorder = Border.fromBorderSide(chatBubbleSide);