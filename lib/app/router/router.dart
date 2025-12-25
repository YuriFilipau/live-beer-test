import 'package:go_router/go_router.dart';
import 'package:live_beer/features/home/view/home.dart';
import 'package:live_beer/features/info/view/info.dart';
import 'package:live_beer/features/profile/view/profile.dart';
import 'package:live_beer/features/shops/view/shops.dart';
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
                    NoTransitionPage(child: Home()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/info',
                name: AppRouter.info.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Info()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/shops',
                name: AppRouter.shops.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Shops()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRouter.profile.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Profile()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
