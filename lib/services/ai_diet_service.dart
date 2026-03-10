
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:health_tracker/models/diet_plan.dart';

class AiDietService {
  List<DietPlan>? _dietPlans;
  final Random _random = Random();

  Future<void> _loadDietPlans() async {
    if (_dietPlans == null) {
      final String jsonString = await rootBundle.loadString('assets/data/diet_plans.json');
      final Map<String, dynamic> json = jsonDecode(jsonString);
      final List<dynamic> dietPlansData = json['diet_plans'];
      _dietPlans = dietPlansData.map((data) => DietPlan.fromJson(data)).toList();
    }
  }

  Future<DietPlan> getDietPlan() async {
    await _loadDietPlans();

    if (_dietPlans == null || _dietPlans!.isEmpty) {
      throw Exception('Could not load diet plans.');
    }

    return _dietPlans![_random.nextInt(_dietPlans!.length)];
  }
}
