import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/app_styles.dart';
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
              topLeft: Radius.circular(AppStyles.radius),
              topRight: Radius.circular(AppStyles.radius),
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
                    color: AppStyles.buttonYellow.withValues(alpha: 0.9),
                  ),
                  child: Center(
                    child: Text(
                      "Привет, $userName!",
                      style: const TextStyle(
                        fontSize: AppStyles.s24,
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
          decoration: const BoxDecoration(
            color: AppStyles.bgWhite,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppStyles.radius),
              bottomRight: Radius.circular(AppStyles.radius),
            ),
          ),
          height: 105,
          width: 400,
          child: Center(child: BarcodeCard(data: barcodeData)),
        ),
      ],
    );
  }
}
