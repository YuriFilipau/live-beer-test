import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';

class BarcodeCard extends StatelessWidget {
  final String data;

  const BarcodeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final bc = Barcode.code128();

    try {
      final svgString = bc.toSvg(
        data,
        width: 350,
        height: 70,
        fontHeight: AppSizes.s18,
        textPadding: AppSizes.s4,
      );

      return SvgPicture.string(svgString, width: 350, height: 70);
    } catch (e) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Ошибка генерации штрих-кода:',
            style: TextStyle(color: AppColors.errorBorder),
          ),
          Text(
            data,
            style: const TextStyle(
              fontSize: AppSizes.s14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      );
    }
  }
}
