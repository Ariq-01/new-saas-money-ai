import 'package:flutter/material.dart';
import '../../../models/chat_message.dart';
import 'box_health.dart';
import 'food_entry_card.dart';
import 'food_entry_mock.dart';

const _mockNutrition = NutritionData(calories: 0, protein: 0, carbs: 0, fat: 0);

class CaloriesSection extends StatelessWidget {
  const CaloriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final pad = mq.size.width * 0.04;

    return Column(
      children: [
        BoxHealth(data: _mockNutrition),
        const SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Column(
            children:
                mockFoodEntries // change
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FoodEntryCard(entry: e),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
