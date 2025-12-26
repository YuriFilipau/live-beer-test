import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/app_styles.dart';
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
        AppStyles.s24,
        AppStyles.s16,
        AppStyles.s10,
        AppStyles.s14,
      ),
      height: 152,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(AppStyles.radius),
      ),
      child: Column(
        spacing: AppStyles.s12,
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
                      color: AppStyles.bgWhite,
                      fontSize: AppStyles.s32,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  const Text(
                    "Накоплено литров",
                    style: TextStyle(
                      color: AppStyles.bgWhite,
                      fontSize: AppStyles.s16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppStyles.s16),
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
                    fontSize: AppStyles.s14,
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
