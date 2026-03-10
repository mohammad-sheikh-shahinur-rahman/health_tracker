
import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({
    required this.name,
    this.photoUrl,
    this.birthday,
    this.weight,
    this.height,
  });

  final String name;
  final String? photoUrl;
  final DateTime? birthday;
  final double? weight; // in kg
  final double? height; // in cm

  User copyWith({
    String? name,
    String? photoUrl,
    DateTime? birthday,
    double? weight,
    double? height,
  }) {
    return User(
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      birthday: birthday ?? this.birthday,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }
}
