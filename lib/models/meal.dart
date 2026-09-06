class Meal {
  const Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.instructions,
    this.category,
  });

  final String id;
  final String name;
  final String thumbnail;
  final String? instructions;
  final String? category;

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'] as String? ?? '',
      name: json['strMeal'] as String? ?? '',
      thumbnail: json['strMealThumb'] as String? ?? '',
      instructions: json['strInstructions'] as String?,
      category: json['strCategory'] as String?,
    );
  }
}
