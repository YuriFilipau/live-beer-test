import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/design/design_tokens.dart';

class NewsButton extends StatelessWidget {
  final String title;
  final String date;
  final NewsButtonType type;
  final VoidCallback onTap;

  const NewsButton({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 138,
        height: 132,
        decoration: BoxDecoration(
          color: DT.buttonYellow,
          borderRadius: BorderRadius.circular(DT.radius),
        ),
        child: Stack(
          children: [
             Padding(
              padding: const EdgeInsets.all(DT.s7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: DT.s6,
                        fontWeight: FontWeight.w600,
                        color: DT.text,
                        height: 1.3,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: DT.s5,
                      fontWeight: FontWeight.w300,
                      color: DT.text,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                type == NewsButtonType.news
                    ? 'assets/icons/news.svg'
                    : 'assets/icons/discount.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
