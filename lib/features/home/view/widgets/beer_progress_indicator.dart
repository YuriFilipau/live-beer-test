import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/design/design_tokens.dart';

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
                ? 'assets/icons/active_beer_cup.svg'
                : 'assets/icons/beer_cup.svg',
            width: 24,
            height: 54,
          ),
          if (i < totalLiters - 2) const SizedBox(width: DT.s3),
        ],

        const SizedBox(width: DT.s3),

        SvgPicture.asset(
          filledLiters == totalLiters
              ? 'assets/icons/active_beer_cup.svg'
              : 'assets/icons/prize_beer_cup.svg',
          width: 24,
          height: 54,
        ),
      ],
    );
  }
}
