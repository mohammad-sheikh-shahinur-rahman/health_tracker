import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> requestAllPermissions() async {
    await [
      Permission.activityRecognition,
      Permission.sensors,
      Permission.notification,
      Permission.scheduleExactAlarm,
      Permission.camera,
      Permission.location,
      Permission.storage,
      Permission.ignoreBatteryOptimizations,
    ].request();
  }
}
