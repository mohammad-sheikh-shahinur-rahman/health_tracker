
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

class AiService {
  Map<String, dynamic>? _responses;
  final Random _random = Random();

  Future<void> _loadResponses() async {
    if (_responses == null) {
      final String jsonString = await rootBundle.loadString('assets/data/chat_responses.json');
      _responses = json.decode(jsonString);
    }
  }

  Future<String> getResponse(String message) async {
    await _loadResponses();

    final lowercaseMessage = message.toLowerCase();

    for (var intent in _responses!['intents']) {
      for (var pattern in intent['patterns']) {
        if (lowercaseMessage.contains(pattern)) {
          final responses = intent['responses'] as List;
          return responses[_random.nextInt(responses.length)];
        }
      }
    }

    final defaultResponses = _responses!['default_responses'] as List;
    return defaultResponses[_random.nextInt(defaultResponses.length)];
  }
}
