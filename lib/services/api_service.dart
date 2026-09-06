import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/meal.dart';

class ApiService {
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  static const _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  final http.Client _client;

  Future<List<String>> fetchCategories() async {
    final data = await _getJson('/categories.php');
    final categories = data['categories'];
    if (categories is! List) {
      throw const FormatException('The category response was invalid.');
    }

    return categories
        .whereType<Map<String, dynamic>>()
        .map((category) => category['strCategory'] as String?)
        .whereType<String>()
        .toList();
  }

  Future<List<Meal>> fetchMealsByCategory(String category) async {
    final encodedCategory = Uri.encodeQueryComponent(category);
    final data = await _getJson('/filter.php?c=$encodedCategory');
    final meals = data['meals'];
    if (meals == null) {
      return [];
    }
    if (meals is! List) {
      throw const FormatException('The meal list response was invalid.');
    }

    return meals
        .whereType<Map<String, dynamic>>()
        .map(Meal.fromJson)
        .toList();
  }

  Future<Meal> fetchMealDetail(String id) async {
    final encodedId = Uri.encodeQueryComponent(id);
    final data = await _getJson('/lookup.php?i=$encodedId');
    final meals = data['meals'];
    if (meals is! List || meals.isEmpty || meals.first is! Map<String, dynamic>) {
      throw const FormatException('Meal details were not found.');
    }

    return Meal.fromJson(meals.first as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>> _getJson(String path) async {
    final response = await _client.get(Uri.parse('$_baseUrl$path'));
    if (response.statusCode != 200) {
      throw http.ClientException(
        'Request failed with status ${response.statusCode}.',
        response.request?.url,
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('The server returned an invalid response.');
    }
    return decoded;
  }
}
