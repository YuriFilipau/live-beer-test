import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';
import 'package:live_beer/features/home/view/widgets/barcode_card.dart';
import 'package:live_beer/gen/assets.gen.dart';

class WelcomeCard extends StatelessWidget {
  final String barcodeData;
  final String userName;

  const WelcomeCard({
    super.key,
    required this.barcodeData,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 85,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.radius),
              topRight: Radius.circular(AppSizes.radius),
            ),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: SvgPicture.asset(
                    Assets.icons.berry,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.buttonYellow.withValues(alpha: 0.9),
                  ),
                  child: Center(
                    child: Text(
                      "Привет, $userName!",
                      style: const TextStyle(
                        fontSize: AppSizes.s24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s24,
            vertical: AppSizes.s16,
          ),
          decoration: const BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppSizes.radius),
              bottomRight: Radius.circular(AppSizes.radius),
            ),
          ),
          height: 105,
          child: Center(
            child: Column(
              spacing: AppSizes.s6,
              children: [
                BarcodeCard(data: barcodeData),
                // or just use drawText from the barcode package, without splitting
                Row(
                  children: barcodeData
                      .split('')
                      .map(
                        (char) => Expanded(
                          child: Center(
                            child: Text(
                              char,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
