
import 'package:flutter/foundation.dart';

@immutable
class Meal {
  const Meal({
    required this.name,
    required this.description,
    required this.calories,
  });

  final String name;
  final String description;
  final int calories;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'] as String,
      description: json['description'] as String,
      calories: json['calories'] as int,
    );
  }
}

@immutable
class DietPlan {
  const DietPlan({
    required this.name,
    required this.totalCalories,
    required this.meals,
  });

  final String name;
  final int totalCalories;
  final List<Meal> meals;

  factory DietPlan.fromJson(Map<String, dynamic> json) {
    final mealsData = json['meals'] as List<dynamic>?;
    final meals = mealsData != null
        ? mealsData.map((mealData) => Meal.fromJson(mealData)).toList()
        : <Meal>[];

    return DietPlan(
      name: json['name'] as String,
      totalCalories: json['total_calories'] as int,
      meals: meals,
    );
  }
}
