
import 'package:hive/hive.dart';
import 'package:health_tracker/models/user_model.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 4; // Assuming 4 is the next available typeId

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
      photoUrl: fields[1] as String?,
      birthday: fields[2] as DateTime?,
      weight: fields[3] as double?,
      height: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.photoUrl)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.height);
  }
}
