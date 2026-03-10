
import 'package:flutter/material.dart';
import 'package:health_tracker/models/diet_plan.dart';
import 'package:health_tracker/services/ai_diet_service.dart';

class AiDietViewModel extends ChangeNotifier {
  final AiDietService _aiDietService = AiDietService();

  DietPlan? _dietPlan;
  DietPlan? get dietPlan => _dietPlan;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AiDietViewModel() {
    fetchDietPlan();
  }

  Future<void> fetchDietPlan() async {
    _isLoading = true;
    notifyListeners();

    _dietPlan = await _aiDietService.getDietPlan();

    _isLoading = false;
    notifyListeners();
  }
}
