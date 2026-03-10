import 'package:hive/hive.dart';

part 'blood_glucose.g.dart';

@HiveType(typeId: 2)
class BloodGlucose extends HiveObject {
  @HiveField(0)
  late double level;

  @HiveField(1)
  late DateTime timestamp;

  BloodGlucose({
    required this.level,
    required this.timestamp,
  });
}
