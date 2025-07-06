import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slideAnimation});

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, state) {
        return SlideTransition(
          position: slideAnimation,
          child: const Text(
            'Read Free Books',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
