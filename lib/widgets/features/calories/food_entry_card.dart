import 'package:flutter/material.dart';
import 'food_entry_mock.dart';

class FoodEntryCard extends StatelessWidget {
  final FoodEntry entry;
  const FoodEntryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category
          Text(entry.category, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          const SizedBox(height: 2),
          // Food name
          Text(entry.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          const Divider(height: 1),
          const SizedBox(height: 10),
          // Macro columns
          Row(
            children: [
              _MacroCol(label: 'Calories', value: '${entry.calories}', pct: entry.carbsPct, pctLabel: '2%'),
              _MacroCol(label: 'Carbs', value: entry.carbs, pct: entry.carbsPct, pctLabel: '4%'),
              _MacroCol(label: 'Protein', value: entry.protein, pct: entry.proteinPct, pctLabel: '2%'),
              _MacroCol(label: 'Fat', value: entry.fat, pct: entry.fatPct, pctLabel: '0%'),
            ],
          ),
          const SizedBox(height: 10),
          // Footer
          Row(
            children: [
              Text(entry.time, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              const Spacer(),
              Icon(Icons.edit_outlined, size: 18, color: Colors.grey.shade600),
              const SizedBox(width: 14),
              Icon(Icons.more_vert, size: 18, color: Colors.grey.shade600),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroCol extends StatelessWidget {
  final String label;
  final String value;
  final double pct;
  final String pctLabel;

  const _MacroCol({
    required this.label,
    required this.value,
    required this.pct,
    required this.pctLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: pct,
            minHeight: 3,
            backgroundColor: Colors.grey.shade200,
            color: const Color(0xFF90CAF9),
          ),
          const SizedBox(height: 3),
          Text(pctLabel, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}
