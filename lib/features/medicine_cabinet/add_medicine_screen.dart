import 'package:flutter/material.dart';
import 'package:health_tracker/models/medicine.dart';
import 'package:health_tracker/services/notification_service.dart';
import 'package:hive/hive.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _scheduleController = TextEditingController();
  final _inventoryController = TextEditingController();
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _scheduleController.dispose();
    _inventoryController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveMedicine() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a reminder time.')),
        );
        return;
      }

      final now = DateTime.now();
      final reminderTime = DateTime(now.year, now.month, now.day, _selectedTime!.hour, _selectedTime!.minute);
      final notificationId = now.millisecondsSinceEpoch.remainder(100000);

      final medicine = Medicine(
        name: _nameController.text,
        dosage: _dosageController.text,
        schedule: _scheduleController.text,
        inventory: int.parse(_inventoryController.text),
        reminderTime: reminderTime,
        notificationId: notificationId,
      );

      await Hive.box<Medicine>('medicines').add(medicine);
      await NotificationService().scheduleNotification(
        notificationId,
        'Medication Reminder',
        'Time to take your ${medicine.name} (${medicine.dosage}).',
        reminderTime,
      );

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Medicine Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dosageController,
                decoration: const InputDecoration(labelText: 'Dosage (e.g., 1 tablet, 10ml)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a dosage';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _scheduleController,
                decoration: const InputDecoration(labelText: 'Schedule (e.g., Daily, After breakfast)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a schedule';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _inventoryController,
                decoration: const InputDecoration(labelText: 'Inventory (pills left)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ListTile(
                title: const Text('Reminder Time'),
                subtitle: Text(_selectedTime?.format(context) ?? 'Not set'),
                trailing: const Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveMedicine,
                child: const Text('Save Medicine'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
