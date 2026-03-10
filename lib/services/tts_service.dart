import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final TtsService _ttsService = TtsService._internal();
  factory TtsService() => _ttsService;

  TtsService._internal();

  final FlutterTts _flutterTts = FlutterTts();

  Future<void> init() async {
    await _flutterTts.setLanguage("bn-BD");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
  }

  void speak(String text) {
    _flutterTts.speak(text);
  }
}
