import 'package:flutter/material.dart';
import 'package:health_tracker/features/medicine_cabinet/add_medicine_screen.dart';
import 'package:health_tracker/models/medicine.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MedicineCabinetScreen extends StatefulWidget {
  const MedicineCabinetScreen({super.key});

  @override
  State<MedicineCabinetScreen> createState() => _MedicineCabinetScreenState();
}

class _MedicineCabinetScreenState extends State<MedicineCabinetScreen> {
  final Box<Medicine> _medicineBox = Hive.box<Medicine>('medicines');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Cabinet'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _medicineBox.listenable(),
        builder: (context, Box<Medicine> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('No medicines added yet.'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final medicine = box.getAt(index) as Medicine;
              return ListTile(
                title: Text(medicine.name),
                subtitle: Text('${medicine.dosage} - ${medicine.schedule}'),
                trailing: Text('${medicine.inventory} left'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicineScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
