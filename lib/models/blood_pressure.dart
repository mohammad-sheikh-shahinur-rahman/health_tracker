import 'package:hive/hive.dart';

part 'blood_pressure.g.dart';

@HiveType(typeId: 1)
class BloodPressure extends HiveObject {
  @HiveField(0)
  late int systolic;

  @HiveField(1)
  late int diastolic;

  @HiveField(2)
  late int pulse;

  @HiveField(3)
  late DateTime timestamp;

  BloodPressure({
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.timestamp,
  });
}
