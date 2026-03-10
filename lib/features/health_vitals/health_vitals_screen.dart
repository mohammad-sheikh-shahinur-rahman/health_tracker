import 'package:flutter/material.dart';
import 'package:health_tracker/features/health_vitals/add_health_vitals_screen.dart';
import 'package:health_tracker/models/blood_glucose.dart';
import 'package:health_tracker/models/blood_pressure.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HealthVitalsScreen extends StatefulWidget {
  const HealthVitalsScreen({super.key});

  @override
  State<HealthVitalsScreen> createState() => _HealthVitalsScreenState();
}

class _HealthVitalsScreenState extends State<HealthVitalsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Vitals'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Blood Pressure'),
            Tab(text: 'Blood Glucose'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBloodPressureTab(),
          _buildBloodGlucoseTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddHealthVitalsScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBloodPressureTab() {
    final bpBox = Hive.box<BloodPressure>('blood_pressure');
    return ValueListenableBuilder(
      valueListenable: bpBox.listenable(),
      builder: (context, Box<BloodPressure> box, _) {
        if (box.values.isEmpty) {
          return const Center(child: Text('No blood pressure readings yet.'));
        }
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final reading = box.getAt(index)!;
            return ListTile(
              title: Text('${reading.systolic}/${reading.diastolic} mmHg'),
              subtitle: Text('Pulse: ${reading.pulse} bpm'),
              trailing: Text(reading.timestamp.toString()),
            );
          },
        );
      },
    );
  }

  Widget _buildBloodGlucoseTab() {
    final glucoseBox = Hive.box<BloodGlucose>('blood_glucose');
    return ValueListenableBuilder(
      valueListenable: glucoseBox.listenable(),
      builder: (context, Box<BloodGlucose> box, _) {
        if (box.values.isEmpty) {
          return const Center(child: Text('No blood glucose readings yet.'));
        }
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final reading = box.getAt(index)!;
            return ListTile(
              title: Text('${reading.level} mg/dL'),
              trailing: Text(reading.timestamp.toString()),
            );
          },
        );
      },
    );
  }
}
