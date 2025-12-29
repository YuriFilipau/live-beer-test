import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';
import 'package:live_beer/app/data/test_data/test_news.dart';
import 'package:live_beer/features/info/view/widgets/modal_bottom_sheet.dart';
import 'package:live_beer/features/info/view/widgets/news_card.dart';
import 'package:live_beer/gen/assets.gen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  NewsButtonType? _selectedType = NewsButtonType.discounts;

  List<Map<String, dynamic>> _getCurrentData() {
    return NewsData.getMapByType(_selectedType!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.icons.largeBerry,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 78),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
                    child: Text(
                      "Информация",
                      style: TextStyle(
                        fontSize: AppSizes.s36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSizes.s24,
                      AppSizes.s16,
                      AppSizes.s24,
                      0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl<NewsButtonType>(
                        groupValue: _selectedType,
                        children: {
                          NewsButtonType.discounts: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: AppSizes.s8,
                            ),
                            child: const Text(
                              "Акции",
                              style: TextStyle(fontSize: AppSizes.s14),
                            ),
                          ),
                          NewsButtonType.news: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: AppSizes.s8,
                            ),
                            child: const Text(
                              "Новости",
                              style: TextStyle(fontSize: AppSizes.s14),
                            ),
                          ),
                        },
                        onValueChanged: (NewsButtonType? value) {
                          setState(() {
                            _selectedType = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.s24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.s24,
                    ),
                    child: _buildContentList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentList() {
    final filteredData = _getCurrentData();

    if (filteredData.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.s24),
        child: Center(
          child: Text(
            "Нет данных",
            style: TextStyle(color: AppColors.textLiteGrey),
          ),
        ),
      );
    }

    return Column(
      children: filteredData.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.s8),
          child: NewsCard(
            onTap: () {
              _showCupertinoBottomSheet(context, item);
            },
            title: item['title'],
            date: item['date'],
            image: item['image'],
          ),
        );
      }).toList(),
    );
  }

  void _showCupertinoBottomSheet(
    BuildContext context,
    Map<String, dynamic> item,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return ModalBottomSheet(
          title: item['title'],
          date: item['date'],
          image: item['large_image'],
          description: item['description'],
          type: item['type'],
        );
      },
    );
  }
}
