import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/app_styles.dart';

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
          color: AppStyles.buttonYellow,
          borderRadius: BorderRadius.circular(AppStyles.radius),
        ),
        height: 56,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: AppStyles.s16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
