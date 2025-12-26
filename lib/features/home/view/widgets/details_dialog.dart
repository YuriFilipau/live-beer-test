import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/app_styles.dart';
import 'package:live_beer/gen/assets.gen.dart';
import 'package:live_beer/shared/widgets/button.dart';

class DetailsDialog extends StatelessWidget {
  const DetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppStyles.s24),
            child: Container(
              decoration: BoxDecoration(
                color: AppStyles.bgGrey,
                borderRadius: BorderRadius.circular(AppStyles.radius),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(AppStyles.s24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Правила накопления баллов и литров",
                          style: TextStyle(fontSize: AppStyles.s24, height: 1.3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: AppStyles.s16, bottom: AppStyles.s8),
                          child: Text(
                            "1 балл = 1 рубль",
                            style: TextStyle(
                              fontSize: AppStyles.s16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Посещайте магазины сети LiveBeer"
                          " и получайте процент накоплений от суммы покупки."
                          " Обязательно предъявите карту, до начала оплаты.",
                          style: TextStyle(fontSize: AppStyles.s16, height: 1.8),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: SvgPicture.asset(Assets.icons.details),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: AppStyles.s24, right: AppStyles.s24),
              child: Button(
                title: "Закрыть",
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
