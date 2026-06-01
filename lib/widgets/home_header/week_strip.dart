import 'package:flutter/material.dart';

class WeekStrip extends StatelessWidget {
  const WeekStrip({super.key});

  List<DateTime> _days() {
    final today = DateTime.now();
    final sat = today.subtract(Duration(days: (today.weekday % 7 + 1) % 7));
    return List.generate(7, (i) => sat.add(Duration(days: i)));
  }

  static const _labels = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  @override
  Widget build(BuildContext context) {
    final days = _days();
    final today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(days.length, (i) {
          final d = days[i];
          final isToday =
              d.day == today.day &&
              d.month == today.month &&
              d.year == today.year;
          return _DayCell(label: _labels[i], day: d.day, isToday: isToday);
        }),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final String label;
  final int day;
  final bool isToday;

  const _DayCell({required this.label, required this.day, required this.isToday});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: isToday
          ? BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF4CAF50), width: 1.5),
            )
          : null,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isToday ? const Color(0xFF2E7D32) : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$day',
            style: TextStyle(
              fontSize: 16,
              fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
              color: isToday ? const Color(0xFF2E7D32) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
