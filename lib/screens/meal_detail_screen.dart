import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../services/api_service.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({super.key, required this.mealId});

  final String mealId;

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final ApiService _apiService = ApiService();
  bool isFavorite = false;
  late final Future<Meal> _mealFuture;

  @override
  void initState() {
    super.initState();
    _mealFuture = _apiService.fetchMealDetail(widget.mealId);
  }

  void _toggleFavorite() {
    setState(() => isFavorite = !isFavorite);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite ? 'Added to favorites.' : 'Removed from favorites.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: FutureBuilder<Meal>(
        future: _mealFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Could not load recipe details:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          final meal = snapshot.data;
          if (meal == null) {
            return const Center(child: Text('Recipe not found.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.network(
                      meal.thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const ColoredBox(
                        color: Colors.black12,
                        child: Center(
                          child: Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(meal.name, style: Theme.of(context).textTheme.headlineSmall),
                if (meal.category?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 12),
                  Chip(label: Text(meal.category!)),
                ],
                const SizedBox(height: 20),
                Text('Instructions', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(meal.instructions?.trim().isNotEmpty ?? false
                    ? meal.instructions!
                    : 'Instructions are not available for this recipe.'),
              ],
            ),
          );
        },
      ),
    );
  }
}
