import 'package:go_router/go_router.dart';
import 'package:live_beer/features/home/view/home_screen.dart';
import 'package:live_beer/features/info/view/info_screen.dart';
import 'package:live_beer/features/profile/view/profile_screen.dart';
import 'package:live_beer/features/shops/view/shops_screen.dart';
import 'package:live_beer/shared/widgets/bottom_navigation.dart';

enum AppRouter { home, info, shops, profile }

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) =>
            BottomNavigationScaffold(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: AppRouter.home.name,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/info',
                name: AppRouter.info.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: InfoScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/shops',
                name: AppRouter.shops.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ShopsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRouter.profile.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfileScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
