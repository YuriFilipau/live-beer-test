import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:live_beer/app/constants/app_styles.dart';
import 'package:live_beer/gen/assets.gen.dart';

class BottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell shell;

  const BottomNavigationScaffold({super.key, required this.shell});

  void _onTap(int index) =>
      shell.goBranch(index, initialLocation: index == shell.currentIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(
          AppStyles.s24,
          AppStyles.s12,
          AppStyles.s24,
          0,
        ),
        height: 95,
        color: AppStyles.bgDarkGrey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavigationItem(
              title: "Главная",
              icon: Assets.icons.home,
              isSelected: shell.currentIndex == 0,
              onTap: () => _onTap(0),
            ),
            _NavigationItem(
              title: "Информация",
              icon: Assets.icons.info,
              isSelected: shell.currentIndex == 1,
              onTap: () => _onTap(1),
            ),
            _NavigationItem(
              title: "Магазины",
              icon: Assets.icons.shoppingCart,
              isSelected: shell.currentIndex == 2,
              onTap: () => _onTap(2),
            ),
            _NavigationItem(
              title: "Профиль",
              icon: Assets.icons.user,
              isSelected: shell.currentIndex == 3,
              onTap: () => _onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  const _NavigationItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppStyles.buttonYellow
                    : AppStyles.bgWhite.withValues(alpha: 0.5),
                BlendMode.srcIn,
              ),
              width: AppStyles.s24,
              height: AppStyles.s24,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: AppStyles.s12,
                color: isSelected
                    ? AppStyles.buttonYellow
                    : AppStyles.bgWhite.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
