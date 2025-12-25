import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/design/design_tokens.dart';

class DetailsDialog extends StatelessWidget {
  const DetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: DT.bgGrey,
            borderRadius: BorderRadius.circular(DT.radius),
          ),
          width: 330,
          height: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Padding(
                padding: EdgeInsets.all(DT.s9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Text(
                        "Посещайте магазины сети LiveBeer и получайте процент накоплений от суммы покупки. Обязательно предъявите карту, до начала оплаты.",
                        style: TextStyle(fontSize: DT.s7, height: 1.8),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                right: -15,
                child: SvgPicture.asset("assets/icons/details.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
