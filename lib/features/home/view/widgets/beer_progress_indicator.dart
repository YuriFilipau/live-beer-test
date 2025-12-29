import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/sizes.dart';
import 'package:live_beer/gen/assets.gen.dart';

class BeerProgressIndicator extends StatelessWidget {
  final int filledLiters;
  final int totalLiters;

  const BeerProgressIndicator({
    super.key,
    required this.filledLiters,
    required this.totalLiters,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < totalLiters - 1; i++) ...[
          SvgPicture.asset(
            i < filledLiters
                ? Assets.icons.activeBeerCup
                : Assets.icons.beerCup,
            width: 24,
            height: 54,
          ),
          if (i < totalLiters - 2) const SizedBox(width: AppSizes.s8),
        ],

        const SizedBox(width: AppSizes.s8),

        SvgPicture.asset(
          filledLiters == totalLiters
              ? Assets.icons.activeBeerCup
              : Assets.icons.prizeBeerCup,
          width: 24,
          height: 54,
        ),
      ],
    );
  }
}
