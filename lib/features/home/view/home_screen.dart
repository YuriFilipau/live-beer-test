import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/constants/colors.dart';
import 'package:live_beer/app/constants/sizes.dart';
import 'package:live_beer/app/data/test_data/test_news.dart';
import 'package:live_beer/app/router/router.dart';
import 'package:live_beer/features/home/view/widgets/beer_reward_card.dart';
import 'package:live_beer/features/home/view/widgets/details_dialog.dart';
import 'package:live_beer/features/home/view/widgets/news_button.dart';
import 'package:live_beer/features/home/view/widgets/point_reward_card.dart';
import 'package:live_beer/features/home/view/widgets/welcome_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Map<String, dynamic>> _getCurrentData() {
    return NewsData.getAllAsMap();
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = _getCurrentData();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.s16,
                  vertical: AppSizes.s8,
                ),
                child: WelcomeCard(
                  barcodeData: "1234567010356443",
                  userName: "Дмитрий",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.s16,
                  right: AppSizes.s16,
                  bottom: AppSizes.s6,
                ),
                child: BeerRewardCard(filledLiters: 8, totalLiters: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.s16,
                  right: AppSizes.s16,
                  bottom: AppSizes.s24,
                ),
                child: PointsRewardCard(
                  score: 3017,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.black.withValues(alpha: 0.6),
                      context: context,
                      builder: (BuildContext context) => const DetailsDialog(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.s16,
                  right: AppSizes.s16,
                  bottom: AppSizes.s16,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.goNamed(AppRouter.info.name);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Будь в курсе",
                        style: TextStyle(
                          fontSize: AppSizes.s24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: AppSizes.s24),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.s16,
                  bottom: AppSizes.s16,
                ),
                child: SizedBox(
                  height: 132,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(right: AppSizes.s16),
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final item = filteredData[index];
                      return NewsButton(
                        onTap: () {},
                        title: item['title'] as String,
                        date: item['date'] as String,
                        type: item['type'] as NewsButtonType,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: AppSizes.s8);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
