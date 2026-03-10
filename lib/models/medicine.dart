import 'package:hive/hive.dart';

part 'medicine.g.dart';

@HiveType(typeId: 0)
class Medicine extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String dosage;

  @HiveField(2)
  late String schedule;

  @HiveField(3)
  late int inventory;

  @HiveField(4)
  late DateTime reminderTime;

  @HiveField(5)
  late int notificationId;

  Medicine({
    required this.name,
    required this.dosage,
    required this.schedule,
    required this.inventory,
    required this.reminderTime,
    required this.notificationId,
  });
}
