import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/constants/app_styles.dart';
import 'package:live_beer/gen/assets.gen.dart';

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
          color: AppStyles.buttonYellow,
          borderRadius: BorderRadius.circular(AppStyles.radius),
        ),
        child: Stack(
          children: [
             Padding(
              padding: const EdgeInsets.all(AppStyles.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: AppStyles.s14,
                        fontWeight: FontWeight.w600,
                        color: AppStyles.text,
                        height: 1.3,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: AppStyles.s12,
                      fontWeight: FontWeight.w300,
                      color: AppStyles.text,
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
                    ? Assets.icons.news
                    : Assets.icons.discount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
