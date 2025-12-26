import 'package:flutter/material.dart';
import 'package:live_beer/app/constants/app_styles.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final VoidCallback? onTap;

  const NewsCard({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.buttonYellow,
          borderRadius: BorderRadius.circular(AppStyles.radius),
        ),
        height: 96,
        padding: const EdgeInsets.all(AppStyles.s16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppStyles.radius),
              ),
              child: Image.asset(
                image,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: AppStyles.s16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: AppStyles.s16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: AppStyles.s12,
                      fontWeight: FontWeight.w300,
                      color: AppStyles.text.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
