import 'package:flutter/material.dart';
import 'package:health_tracker/models/blood_glucose.dart';
import 'package:health_tracker/models/blood_pressure.dart';
import 'package:hive/hive.dart';

class AddHealthVitalsScreen extends StatefulWidget {
  const AddHealthVitalsScreen({super.key});

  @override
  State<AddHealthVitalsScreen> createState() => _AddHealthVitalsScreenState();
}

class _AddHealthVitalsScreenState extends State<AddHealthVitalsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _bpFormKey = GlobalKey<FormState>();
  final _glucoseFormKey = GlobalKey<FormState>();

  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _pulseController = TextEditingController();
  final _glucoseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _systolicController.dispose();
    _diastolicController.dispose();
    _pulseController.dispose();
    _glucoseController.dispose();
    super.dispose();
  }

  void _saveBloodPressure() {
    if (_bpFormKey.currentState!.validate()) {
      final reading = BloodPressure(
        systolic: int.parse(_systolicController.text),
        diastolic: int.parse(_diastolicController.text),
        pulse: int.parse(_pulseController.text),
        timestamp: DateTime.now(),
      );
      Hive.box<BloodPressure>('blood_pressure').add(reading);
      Navigator.pop(context);
    }
  }

  void _saveBloodGlucose() {
    if (_glucoseFormKey.currentState!.validate()) {
      final reading = BloodGlucose(
        level: double.parse(_glucoseController.text),
        timestamp: DateTime.now(),
      );
      Hive.box<BloodGlucose>('blood_glucose').add(reading);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Health Vitals'),
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
          _buildBloodPressureForm(),
          _buildBloodGlucoseForm(),
        ],
      ),
    );
  }

  Widget _buildBloodPressureForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _bpFormKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _systolicController,
              decoration: const InputDecoration(labelText: 'Systolic (mmHg)'),
              keyboardType: TextInputType.number,
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            TextFormField(
              controller: _diastolicController,
              decoration: const InputDecoration(labelText: 'Diastolic (mmHg)'),
              keyboardType: TextInputType.number,
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            TextFormField(
              controller: _pulseController,
              decoration: const InputDecoration(labelText: 'Pulse (bpm)'),
              keyboardType: TextInputType.number,
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: _saveBloodPressure, child: const Text('Save')),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodGlucoseForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _glucoseFormKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _glucoseController,
              decoration: const InputDecoration(labelText: 'Glucose Level (mg/dL)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) => (value == null || value.isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: _saveBloodGlucose, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
