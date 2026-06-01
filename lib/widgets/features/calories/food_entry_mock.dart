class FoodEntry {
  final String category;
  final String name;
  final int calories;
  final String carbs;
  final String protein;
  final String fat;
  final double carbsPct;
  final double proteinPct;
  final double fatPct;
  final String time;

  const FoodEntry({
    required this.category,
    required this.name,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.carbsPct,
    required this.proteinPct,
    required this.fatPct,
    required this.time,
  });
}

const mockFoodEntries = [
  FoodEntry(
    category: 'sushis one peaces',
    name: 'Sushi (one piece) (1 piece)',
    calories: 40,
    carbs: '8g',
    protein: '2g',
    fat: '0g',
    carbsPct: 0.04,
    proteinPct: 0.02,
    fatPct: 0.0,
    time: '08:12',
  ),
];
