
import 'package:flutter/foundation.dart';

@immutable
class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.isMe,
  });

  final String text;
  final bool isMe;
}
