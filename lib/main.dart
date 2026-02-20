import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grit/classes/ViewData.class.dart';
import 'package:grit/layouts/Main.layout.dart';
import 'package:grit/layouts/Secondary.layout.dart';
import 'package:grit/layouts/Tertiary.layout.dart';
import 'package:grit/providers/MainApp.provider.dart';
import 'package:grit/providers/RouteProvider.provider.dart';
import 'package:grit/views/ChooseProfile.view.dart';
import 'package:grit/views/Desc.view.dart';
import 'package:grit/views/Home.view.dart';
import 'package:grit/views/MainHome.view.dart';
import 'package:grit/views/Streak.view.dart';
import 'package:grit/views/StrengthTest.view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
        ChangeNotifierProvider(create: (_) => MainAppProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

final routeData = {
  '/intro/desc': ViewData(idx: 0, nextRoute: '/intro/streak'),
  '/intro/streak': ViewData(idx: 1, nextRoute: '/intro/choose_profile'),
  '/intro/choose_profile': ViewData(idx: 2, nextRoute: '/strength_test')
};

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/strength_test',
          builder: (context, state) => const StrengthTestView(),
        ),
        ShellRoute(
            builder: (context, state, child) {
              return TertiaryLayout(child: child);
            },
            routes: [
              GoRoute(
                path: '/main',
                redirect: (_, state) =>
                    state.matchedLocation == '/main' ? '/main/home' : null,
              ),
              GoRoute(
                path: '/main/home',
                builder: (context, state) => const MainHomeView(),
              ),
            ]),
        ShellRoute(
          builder: (context, state, child) {
            return SecondaryLayout(child: child);
          },
          routes: [
            GoRoute(
              path: '/intro',
              redirect: (_, state) =>
                  state.matchedLocation == '/intro' ? '/intro/desc' : null,
            ),
            GoRoute(
              path: '/intro/desc',
              builder: (context, state) => const DescView(),
            ),
            GoRoute(
              path: '/intro/streak',
              builder: (context, state) => const StreakView(),
            ),
            GoRoute(
              path: '/intro/choose_profile',
              builder: (context, state) => const ChooseProfileView(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
