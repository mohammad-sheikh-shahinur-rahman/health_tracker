
import 'package:flutter/material.dart';
import 'package:health_tracker/features/ai_diet/ai_diet_viewmodel.dart';
import 'package:health_tracker/features/ai_diet/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class AiDietScreen extends StatelessWidget {
  const AiDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AiDietViewModel(),
      child: Consumer<AiDietViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('AI Diet Planner'),
            ),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : viewModel.dietPlan == null
                    ? const Center(child: Text('Could not fetch diet plan.'))
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today\'s Plan: ${viewModel.dietPlan!.totalCalories} kcal',
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            ...viewModel.dietPlan!.meals.map((meal) => MealCard(meal: meal)),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}
