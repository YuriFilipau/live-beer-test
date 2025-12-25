import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_beer/app/constants/enums.dart';
import 'package:live_beer/app/design/design_tokens.dart';
import 'package:live_beer/app/router/router.dart';
import 'package:live_beer/features/home/view/widgets/beer_reward_card.dart';
import 'package:live_beer/features/home/view/widgets/details_dialog.dart';
import 'package:live_beer/features/home/view/widgets/news_button.dart';
import 'package:live_beer/features/home/view/widgets/point_reward_card.dart';
import 'package:live_beer/features/home/view/widgets/welcome_card.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> newsData = [
    {
      'title': 'Новые сорта крафта уже в наличии в магазинах',
      'date': '20.01.2022',
      'type': NewsButtonType.news,
    },
    {
      'title': 'Нам 10 лет повышаем скидку до 10% на всё!',
      'date': '15.03.2022',
      'type': NewsButtonType.discounts,
    },
    {
      'title': 'Новые сорта крафта уже в наличии в магазинах',
      'date': '20.01.2022',
      'type': NewsButtonType.news,
    },
    {
      'title': 'Нам 10 лет повышаем скидку до 10% на всё!',
      'date': '15.03.2022',
      'type': NewsButtonType.discounts,
    },
    {
      'title': 'Новые сорта крафта уже в наличии в магазинах',
      'date': '20.01.2022',
      'type': NewsButtonType.news,
    },
    {
      'title': 'Нам 10 лет повышаем скидку до 10% на всё!',
      'date': '15.03.2022',
      'type': NewsButtonType.discounts,
    },
  ];

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DT.bgGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DT.s7,
                  vertical: DT.s3,
                ),
                child: WelcomeCard(
                  barcodeData: "1234567010356443",
                  userName: "Дмитрий",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: DT.s7,
                  right: DT.s7,
                  bottom: DT.s2,
                ),
                child: BeerRewardCard(filledLiters: 8, totalLiters: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: DT.s7,
                  right: DT.s7,
                  bottom: DT.s9,
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
                  left: DT.s7,
                  right: DT.s7,
                  bottom: DT.s7,
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
                          fontSize: DT.s9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: DT.s9),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: DT.s7, bottom: DT.s7),
                child: SizedBox(
                  height: 132,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(right: DT.s7),
                    scrollDirection: Axis.horizontal,
                    itemCount: newsData.length,
                    itemBuilder: (context, index) {
                      final item = newsData[index];
                      return NewsButton(
                        onTap: () {},
                        title: item['title'] as String,
                        date: item['date'] as String,
                        type: item['type'] as NewsButtonType,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: DT.s3);
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
