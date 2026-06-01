import 'package:flutter/material.dart';

class BoxHealth extends StatelessWidget {
  const BoxHealth({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final horizontalPad = mq.size.width * 0.04;

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontalPad, 0, horizontalPad, 0),
      child: Row(
        children: [
          Expanded(child: _HealthCard(child: _CaloriesContent())),
          const SizedBox(width: 10),
          Expanded(child: _HealthCard(child: _MacrosContent())),
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
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 90); // slot for CaloriesCard content
  }
}

class _MacrosContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 90); // slot for MacrosCard content
  }
}
