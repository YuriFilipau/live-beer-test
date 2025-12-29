import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';
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
          color: AppColors.bgWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radius),
            topRight: Radius.circular(AppSizes.radius),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.s16,
                AppSizes.s8,
                AppSizes.s16,
                AppSizes.s8,
              ),
              child: Row(
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.only(top: AppSizes.s24),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      spacing: 5,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(Assets.icons.back),
                        const Text(
                          'Назад',
                          style: TextStyle(
                            color: AppColors.textLink,
                            fontSize: AppSizes.s17,
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
                color: AppColors.bgWhite,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSizes.s20,
                    AppSizes.s16,
                    AppSizes.s20,
                    AppSizes.s32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: AppSizes.s32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSizes.s8,
                          bottom: AppSizes.s16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.s8,
                                vertical: AppSizes.s4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.buttonYellow,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.labelRadius,
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
                                      left: AppSizes.s4,
                                    ),
                                    child: Text(
                                      type == NewsButtonType.news
                                          ? 'Новость'
                                          : 'Акция',
                                      style: const TextStyle(
                                        fontSize: AppSizes.s12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: AppSizes.s8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.s8,
                                  vertical: AppSizes.s4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonYellow,
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.labelRadius,
                                  ),
                                ),
                                child: Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: AppSizes.s12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radius),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: AppSizes.s20),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: AppSizes.s16,
                          height: 1.3,
                          color: AppColors.text,
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
