import 'package:flutter/material.dart';
import 'package:live_beer/app/design/design_tokens.dart';

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
          color: DT.buttonYellow,
          borderRadius: BorderRadius.circular(DT.radius),
        ),
        height: 96,
        padding: const EdgeInsets.all(DT.s7),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DT.radius),
              ),
              child: Image.asset(
                image,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: DT.s7),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: DT.s7,
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
                      fontSize: DT.s5,
                      fontWeight: FontWeight.w300,
                      color: DT.text.withValues(alpha: 0.8),
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