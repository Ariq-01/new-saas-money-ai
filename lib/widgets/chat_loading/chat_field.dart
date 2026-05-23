import 'package:flutter/material.dart';
import 'loading_indicator.dart';

class ChatField extends StatelessWidget {
  final String textUser;
  final bool isLoading;

  const ChatField({
    super.key,
    required this.textUser,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(textUser, style: const TextStyle(fontSize: 14)),
          if (isLoading) ...[
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingDots(
                  color: Colors.deepPurple,
                  dotSize: 6,
                ),
                const SizedBox(width: 6),
                Text(
                  '⚡ Analysing..',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
