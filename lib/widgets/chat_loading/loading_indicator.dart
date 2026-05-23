import 'package:flutter/material.dart';

/// Titik-titik bergelombang sebagai loading indicator ringan
class LoadingDots extends StatefulWidget {
  final Color color;
  final double dotSize;
  final int count;

  const LoadingDots({
    super.key,
    this.color = Colors.blue,
    this.dotSize = 10,
    this.count = 3,
  });

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (i) {
        final delay = i / widget.count;
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final t = ((_controller.value - delay) % 1.0);
            final offset = t < 0.5 ? -8 * (t * 2) : -8 * (1 - (t - 0.5) * 2);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.dotSize * 0.3),
              child: Transform.translate(
                offset: Offset(0, offset),
                child: CircleAvatar(
                  radius: widget.dotSize / 2,
                  backgroundColor: widget.color,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
