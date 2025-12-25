import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_beer/app/design/theme.dart';
import 'package:live_beer/app/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = buildRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      routerConfig: router,
    );
  }
}
