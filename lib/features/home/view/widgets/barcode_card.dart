import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';
import 'package:live_beer/app/constants/colors.dart';

class BarcodeCard extends StatelessWidget {
  final String data;

  const BarcodeCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final bc = Barcode.code128();

    try {
      final svgString = bc.toSvg(data, width: 400, height: 45, drawText: false);

      return SvgPicture.string(svgString, width: 300, height: 45);
    } catch (e) {
      return const Center(
        child: Text(
          'Ошибка генерации штрих-кода:',
          style: TextStyle(color: AppColors.errorBorder),
        ),
      );
    }
  }
}
