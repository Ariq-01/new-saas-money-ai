import 'package:flutter/material.dart';
import 'box_health.dart';
import 'food_entry_card.dart';
import 'food_entry_mock.dart';

class CaloriesSection extends StatelessWidget {
  const CaloriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final pad = mq.size.width * 0.04;

    return Column(
      children: [
        const BoxHealth(),
        const SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pad),
          child: Column(
            children: mockFoodEntries
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FoodEntryCard(entry: e),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
