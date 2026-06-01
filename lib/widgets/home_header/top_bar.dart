import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: SvgPicture.asset(
              'assets/icon/menu.svg',
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 12),
          Row(
            children: [
              const Text(
                'Today',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                'assets/icon/arrow_dropdown.svg',
                width: 18,
                height: 18,
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset('assets/icon/groud_add.svg', width: 24, height: 24),
          const SizedBox(width: 16),
          Row(
            children: [
              SvgPicture.asset('assets/icon/star.svg', width: 22, height: 22),
              const SizedBox(width: 4),
              const Text('1', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(width: 16),
          SvgPicture.asset('assets/icon/share.svg', width: 22, height: 22),
        ],
      ),
    );
  }
}
