import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/api_service.dart';
import 'meal_detail_screen.dart';

class MealListScreen extends StatelessWidget {
  MealListScreen({super.key, required this.category, ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final String category;
  final ApiService _apiService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: FutureBuilder<List<Meal>>(
        future: _apiService.fetchMealsByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Could not load meals:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final meals = snapshot.data ?? [];
          if (meals.isEmpty) {
            return const Center(child: Text('No meals found in this category.'));
          }

          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    meal.thumbnail,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                title: Text(meal.name),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MealDetailScreen(mealId: meal.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
