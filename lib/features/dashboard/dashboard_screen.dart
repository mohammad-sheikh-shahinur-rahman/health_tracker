import 'package:flutter/material.dart';
import 'package:health_tracker/features/health_vitals/health_vitals_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:math';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _steps = 0;
  final int _stepGoal = 10000;
  final int _waterGoal = 2500;
  final int _calorieGoal = 350;

  @override
  void initState() {
    super.initState();
    Pedometer.stepCountStream.listen(_onStepCount).onError(_onStepCountError);
  }

  void _onStepCount(StepCount event) {
    if (mounted) {
      setState(() {
        _steps = event.steps;
      });
    }
  }

  void _onStepCountError(error) {
    print('Pedometer Error: $error');
  }

  // Dummy data for water and calories
  double get _waterIntake => 1250;
  double get _calories => _steps * 0.04;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Health Center', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildActivityRingCard(),
                  const SizedBox(height: 24),
                  _buildAiVitalityCard(),
                  const SizedBox(height: 24),
                  _buildSystemVitals(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('LIVE DASHBOARD', style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Health Center', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
          ],
        ),
        const Text('Saturday, Jan 10', style: TextStyle(color: Colors.grey)),
        const Text('Hi ! Shahinur Rahman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepPurple)),
      ],
    );
  }

  Widget _buildActivityRingCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _buildActivityRing(),
            const SizedBox(width: 16),
            _buildActivityLabels(),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityRing() {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 12.0,
      percent: min(1.0, _steps / _stepGoal),
      center: const Icon(Icons.flash_on, color: Colors.blue, size: 32),
      backgroundColor: Colors.grey.shade300,
      progressColor: Colors.blue,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  Widget _buildActivityLabels() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActivityLabel('Steps', '$_steps', '$_stepGoal'),
          const SizedBox(height: 12),
          _buildActivityLabel('Water', '${_waterIntake.toStringAsFixed(0)}ml', '${_waterGoal}ml'),
          const SizedBox(height: 12),
          _buildActivityLabel('Kcal', _calories.toStringAsFixed(0), _calorieGoal.toString()),
        ],
      ),
    );
  }

  Widget _buildActivityLabel(String title, String value, String goal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        Row(
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(' / $goal', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: (double.tryParse(value.replaceAll('ml', '')) ?? 0) / (double.tryParse(goal.replaceAll('ml', '')) ?? 1),
          backgroundColor: Colors.grey.shade300,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ],
    );
  }

  Widget _buildAiVitalityCard() {
    return Card(
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('AI VITALITY ANALYSIS', style: TextStyle(color: Colors.white70, fontSize: 12)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('45% Capacity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32)),
                Row(
                  children: [
                    Text('Keep Moving', style: TextStyle(color: Colors.white70)),
                    Icon(Icons.flash_on, color: Colors.yellow, size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemVitals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SYSTEM VITALS', style: TextStyle(color: Colors.grey, fontSize: 12)),
        const Text('Live Health Metrics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildVitalsCard('HEART RATE', '72', 'BPM', Icons.favorite, Colors.red.withOpacity(0.1)),
              const SizedBox(width: 16),
              _buildVitalsCard('SLEEP', '8h 15m', '', Icons.nightlight_round, Colors.blue.withOpacity(0.1)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVitalsCard(String title, String value, String unit, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text(unit, style: const TextStyle(color: Colors.grey)),
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
