import 'package:flutter/material.dart';
import '../../../models/chat_message.dart';

class BoxHealth extends StatelessWidget {
  final NutritionData data;
  const BoxHealth({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final horizontalPad = MediaQuery.of(context).size.width * 0.04;
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPad, 0, horizontalPad, 0),
      child: Row(
        children: [
          Expanded(child: _HealthCard(child: _CaloriesContent(calories: data.calories))),
          const SizedBox(width: 10),
          Expanded(child: _HealthCard(child: _MacrosContent(protein: data.protein, carbs: data.carbs, fat: data.fat))),
        ],
      ),
    );
  }
}

class _HealthCard extends StatelessWidget {
  final Widget child;
  const _HealthCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}

// ── Placeholder content slots ─────────────────────────────────────────────────
// Replace these with real widgets later

class _CaloriesContent extends StatelessWidget {
  final double calories;
  const _CaloriesContent({required this.calories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Center(child: Text('${calories.toStringAsFixed(0)} kcal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}

class _MacrosContent extends StatelessWidget {
  final double protein, carbs, fat;
  const _MacrosContent({required this.protein, required this.carbs, required this.fat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('P: ${protein.toStringAsFixed(1)}g'),
          Text('C: ${carbs.toStringAsFixed(1)}g'),
          Text('F: ${fat.toStringAsFixed(1)}g'),
        ],
      ),
    );
  }
}
