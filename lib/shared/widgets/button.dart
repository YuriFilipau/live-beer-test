import 'package:flutter/material.dart';
import 'package:live_beer/app/design/design_tokens.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const Button({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: DT.buttonYellow,
          borderRadius: BorderRadius.circular(DT.radius),
        ),
        height: 56,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: DT.s7,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
