
import 'package:health_tracker/models/user_model.dart';
import 'package:hive/hive.dart';

class UserService {
  static const String _boxName = 'userBox';

  Future<Box<User>> get _userBox async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<User>(_boxName);
    } else {
      return await Hive.openBox<User>(_boxName);
    }
  }

  Future<void> saveUser(User user) async {
    final box = await _userBox;
    await box.put(0, user); // Using a single key for a single user profile
  }

  Future<User?> getUser() async {
    final box = await _userBox;
    return box.get(0);
  }
}
