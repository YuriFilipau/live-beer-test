import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';

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
          color: AppColors.buttonYellow,
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        height: 56,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: AppSizes.s16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
