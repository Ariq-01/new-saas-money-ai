class NutritionData {
  final double calories;
  final double protein;
  final double carbs;
  final double fat;

  const NutritionData({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory NutritionData.fromJson(Map<String, dynamic> json) => NutritionData(
        calories: (json['calories'] as num).toDouble(),
        protein: (json['protein'] as num).toDouble(),
        carbs: (json['carbs'] as num).toDouble(),
        fat: (json['fat'] as num).toDouble(),
      );
}

class ChatMessage {
  final String userText;
  final String? aiText;
  final NutritionData? nutritionData;

  const ChatMessage({
    required this.userText,
    this.aiText,
    this.nutritionData,
  });
}
