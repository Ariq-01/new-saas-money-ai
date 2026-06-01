import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'chat_input.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onCamera;
  final VoidCallback? onGallery;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onCamera,
    this.onGallery,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 12, 12, bottom + 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: onCamera,
            icon: SvgPicture.asset(
              'assets/icon/photo_camera.svg',
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: onGallery,
            icon: SvgPicture.asset(
              'assets/icon/image.svg',
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Ask something...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
              ),
              onSubmitted: (_) => onSend(),
            ),
          ),

          const SizedBox(width: 8),
          IconButton.filled(onPressed: onSend, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
