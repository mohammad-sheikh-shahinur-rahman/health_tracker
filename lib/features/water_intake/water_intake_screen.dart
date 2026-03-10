import 'package:flutter/material.dart';
import 'package:health_tracker/services/tts_service.dart';
import 'dart:math';

class WaterIntakeScreen extends StatefulWidget {
  const WaterIntakeScreen({super.key});

  @override
  State<WaterIntakeScreen> createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  final TtsService _ttsService = TtsService();
  int _currentIntake = 0;
  int _dailyGoal = 2000; // Base goal in ml
  final int _temperature = 28; // Placeholder for local temperature in Celsius

  @override
  void initState() {
    super.initState();
    _calculateDynamicGoal();
  }

  void _calculateDynamicGoal() {
    // Simple logic: increase goal by 10% for every 5 degrees above 25C
    if (_temperature > 25) {
      final tempFactor = ((_temperature - 25) / 5).floor();
      setState(() {
        _dailyGoal = 2000 + (200 * tempFactor);
      });
    }
  }

  void _addWater(int amount) {
    setState(() {
      _currentIntake = min(_currentIntake + amount, _dailyGoal);
    });
  }

  void _speakReminder() {
    _ttsService.speak("বন্ধু, অনেকক্ষণ পানি খাওয়া হয়নি, শরীর হাইড্রেটেড রাখতে এক গ্লাস পানি খেয়ে নাও।");
  }
  
  double get _progress => _currentIntake / _dailyGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Intake'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildWaterTrackerCard(),
            const SizedBox(height: 24),
            _buildLoggingButtons(),
            const SizedBox(height: 24),
            _buildVoiceReminderCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildWaterTrackerCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.water_drop, size: 40, color: Colors.blue),
                      const SizedBox(height: 8),
                      Text(
                        '$_currentIntake',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '/ $_dailyGoal ml',
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => _addWater(250),
          child: const Text('+250 ml'),
        ),
        ElevatedButton(
          onPressed: () => _addWater(500),
          child: const Text('+500 ml'),
        ),
      ],
    );
  }

  Widget _buildVoiceReminderCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.record_voice_over, color: Colors.blueAccent),
        title: const Text('Voice Reminder'),
        subtitle: const Text('Get a spoken reminder in Bangla'),
        onTap: _speakReminder,
      ),
    );
  }
}
