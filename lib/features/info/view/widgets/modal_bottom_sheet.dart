import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/constants/app_styles.dart';
import 'package:live_beer/gen/assets.gen.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  final String description;
  final NewsButtonType type;

  const ModalBottomSheet({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.description,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: const BoxDecoration(
          color: AppStyles.bgWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.radius),
            topRight: Radius.circular(AppStyles.radius),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppStyles.s16,
                AppStyles.s8,
                AppStyles.s16,
                AppStyles.s8,
              ),
              child: Row(
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.only(top: AppStyles.s24),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      spacing: 5,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Assets.icons.back),
                        const Text(
                          'Назад',
                          style: TextStyle(
                            color: AppStyles.textLink,
                            fontSize: AppStyles.s17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Material(
                color: AppStyles.bgWhite,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppStyles.s20,
                    AppStyles.s16,
                    AppStyles.s20,
                    AppStyles.s32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: AppStyles.s32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppStyles.s8,
                          bottom: AppStyles.s16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppStyles.s8,
                                vertical: AppStyles.s4,
                              ),
                              decoration: BoxDecoration(
                                color: AppStyles.buttonYellow,
                                borderRadius: BorderRadius.circular(
                                  AppStyles.labelRadius,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    type == NewsButtonType.news
                                        ? Assets.icons.mic
                                        : Assets.icons.discountSmall,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: AppStyles.s4,
                                    ),
                                    child: Text(
                                      type == NewsButtonType.news
                                          ? 'Новость'
                                          : 'Акция',
                                      style: const TextStyle(
                                        fontSize: AppStyles.s12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppStyles.s8,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppStyles.s8,
                                  vertical: AppStyles.s4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppStyles.buttonYellow,
                                  borderRadius: BorderRadius.circular(
                                    AppStyles.labelRadius,
                                  ),
                                ),
                                child: Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: AppStyles.s12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppStyles.radius),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: AppStyles.s20),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: AppStyles.s16,
                          height: 1.3,
                          color: AppStyles.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
