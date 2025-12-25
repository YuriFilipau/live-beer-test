import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/design/design_tokens.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: DT.s9),
            child: Container(
              decoration: BoxDecoration(
                color: DT.bgGrey,
                borderRadius: BorderRadius.circular(DT.radius),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(DT.s9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Правила накопления баллов и литров",
                          style: TextStyle(fontSize: DT.s9, height: 1.3),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: DT.s7, bottom: DT.s3),
                          child: Text(
                            "1 балл = 1 рубль",
                            style: TextStyle(
                              fontSize: DT.s7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Посещайте магазины сети LiveBeer"
                          " и получайте процент накоплений от суммы покупки."
                          " Обязательно предъявите карту, до начала оплаты.",
                          style: TextStyle(fontSize: DT.s7, height: 1.8),
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
              padding: const EdgeInsets.only(left: DT.s9, right: DT.s9),
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
