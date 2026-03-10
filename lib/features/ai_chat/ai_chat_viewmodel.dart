
import 'package:flutter/material.dart';
import 'package:health_tracker/models/chat_message.dart';
import 'package:health_tracker/services/ai_service.dart';

class AiChatViewModel extends ChangeNotifier {
  final AiService _aiService = AiService();
  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;

  Future<void> sendMessage(String text) async {
    _messages.add(ChatMessage(text: text, isMe: true));
    notifyListeners();

    final String response = await _aiService.getResponse(text);
    _messages.add(ChatMessage(text: response, isMe: false));
    notifyListeners();
  }
}
