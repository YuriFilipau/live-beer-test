import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';
import 'package:live_beer/app/design/design_tokens.dart';

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
              topLeft: Radius.circular(DT.radius),
              topRight: Radius.circular(DT.radius),
            ),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: SvgPicture.asset(
                    "assets/icons/berry.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: DT.buttonYellow.withValues(alpha: 0.9),
                  ),
                  child: Center(
                    child: Text(
                      "Привет, $userName!",
                      style: const TextStyle(
                        fontSize: DT.s9,
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
            color: DT.bgWhite,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(DT.radius),
              bottomRight: Radius.circular(DT.radius),
            ),
          ),
          height: 105,
          width: 400,
          child: Center(child: _buildBarcode()),
        ),
      ],
    );
  }

  Widget _buildBarcode() {
    final bc = Barcode.code128();

    try {
      final svgString = bc.toSvg(
        barcodeData,
        width: 350,
        height: 70,
        fontHeight: DT.s8,
        textPadding: DT.s1,
      );

      return SvgPicture.string(svgString, width: 350, height: 70);
    } catch (e) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Ошибка генерации штрих-кода:',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            barcodeData,
            style: const TextStyle(
              fontSize: DT.s6,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      );
    }
  }
}
