import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';
import 'package:live_beer/gen/assets.gen.dart';

class PointsRewardCard extends StatelessWidget {
  final VoidCallback onTap;
  final int score;

  const PointsRewardCard({super.key, required this.score, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppSizes.s24),
      height: 126,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  score.toString(),
                  style: const TextStyle(
                    color: AppColors.bgWhite,
                    fontSize: AppSizes.s32,
                    fontWeight: FontWeight.w800,
                    height: 0.75,
                  ),
                ),
                const Text(
                  "Накоплено баллов",
                  style: TextStyle(
                    color: AppColors.bgWhite,
                    fontSize: AppSizes.s16,
                    fontWeight: FontWeight.w700,
                    height: 2,
                  ),
                ),
                Text(
                  "Собирайте баллы и получайте бонусы",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: AppSizes.s14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160,
            height: 132,
            child: Image.asset(Assets.images.beer.path),
          ),
          GestureDetector(
            onTap: onTap,
            child: Transform.translate(
              offset: const Offset(5, -5),
              child: SvgPicture.asset(Assets.icons.details),
            ),
          ),
        ],
      ),
    );
  }
}
