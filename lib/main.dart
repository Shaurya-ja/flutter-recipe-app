import 'package:flutter/material.dart';

import 'screens/category_screen.dart';

void main() {
  runApp(const RecipeMealPlannerApp());
}

class RecipeMealPlannerApp extends StatelessWidget {
  const RecipeMealPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe & Meal Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: CategoryScreen(),
    );
  }
}
