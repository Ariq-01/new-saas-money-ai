import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'week_strip.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TopBar(),
        SizedBox(height: 4),
        WeekStrip(),
      ],
    );
  }
}
