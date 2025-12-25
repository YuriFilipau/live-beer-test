import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/design/design_tokens.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;
  final String date;
  final String? image;
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
          color: DT.bgWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DT.radius),
            topRight: Radius.circular(DT.radius),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(DT.s7, DT.s3, DT.s7, DT.s3),
              child: Row(
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.only(top: DT.s9),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      spacing: 5,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset("assets/icons/back.svg"),
                        const Text(
                          'Назад',
                          style: TextStyle(color: DT.textLink, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Material(
                color: DT.bgWhite,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    DT.s12,
                    DT.s7,
                    DT.s12,
                    DT.s10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: DT.s10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: DT.s3,
                          bottom: DT.s7,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: DT.s3,
                                vertical: DT.s1,
                              ),
                              decoration: BoxDecoration(
                                color: DT.buttonYellow,
                                borderRadius: BorderRadius.circular(
                                  DT.labelRadius,
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    type == NewsButtonType.news
                                        ? 'assets/icons/mic.svg'
                                        : 'assets/icons/discount_small.svg',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: DT.s1),
                                    child: Text(
                                      type == NewsButtonType.news
                                          ? 'Новость'
                                          : 'Акция',
                                      style: const TextStyle(
                                        fontSize: DT.s5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: DT.s3),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: DT.s3,
                                  vertical: DT.s1,
                                ),
                                decoration: BoxDecoration(
                                  color: DT.buttonYellow,
                                  borderRadius: BorderRadius.circular(
                                    DT.labelRadius,
                                  ),
                                ),
                                child: Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: DT.s5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(DT.radius),
                          child: Image.asset(
                            image ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      const SizedBox(height: DT.s12),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: DT.s7,
                          height: 1.3,
                          color: DT.text,
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
