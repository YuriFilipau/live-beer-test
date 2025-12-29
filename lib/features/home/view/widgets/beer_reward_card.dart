import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';
import 'package:live_beer/features/home/view/widgets/beer_progress_indicator.dart';

class BeerRewardCard extends StatelessWidget {
  final int totalLiters;
  final int filledLiters;

  const BeerRewardCard({
    super.key,
    required this.filledLiters,
    required this.totalLiters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.s24,
        AppSizes.s16,
        AppSizes.s10,
        AppSizes.s14,
      ),
      height: 152,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        spacing: AppSizes.s12,
        children: [
          BeerProgressIndicator(
            filledLiters: filledLiters,
            totalLiters: totalLiters,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$filledLiters/$totalLiters",
                    style: const TextStyle(
                      color: AppColors.bgWhite,
                      fontSize: AppSizes.s32,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  const Text(
                    "Накоплено литров",
                    style: TextStyle(
                      color: AppColors.bgWhite,
                      fontSize: AppSizes.s16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
                child: SizedBox(
                  height: 41,
                  child: VerticalDivider(
                    color: Colors.white.withValues(alpha: 0.3),
                    thickness: 1,
                  ),
                ),
              ),

              Expanded(
                child: Text(
                  "Копите литры и получайте пиво бесплатно",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: AppSizes.s14,
                    height: 1.2,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
