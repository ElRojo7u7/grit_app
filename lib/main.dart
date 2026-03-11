import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grit/classes/ViewData.class.dart';
import 'package:grit/providers/UserProfile.provider.dart';
import 'package:grit/repositories/UserProfile/SharedPrefsUserProfile.repository.dart';
import 'package:grit/services/NotificationService.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layouts/index.dart';
import 'views/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notifications = NotificationService();
  await notifications.init();
  await notifications.scheduleDaily(
    id: 1,
    title: "Comienza tu racha",
    body: "Comienza tu día cumpliendo tu objetivo",
    hour: 8,
    minute: 0,
  );
  await notifications.scheduleDaily(
    id: 2,
    title: "Activa la racha",
    body: "Recuerda cumplir tu objetivo diario",
    hour: 16,
    minute: 30,
  );
  await notifications.scheduleDaily(
    id: 3,
    title: "No pierdas tu racha",
    body: "Todavía estás a tiempo de cumplir tu objetivo",
    hour: 20,
    minute: 0,
  );

  final prefs = await SharedPreferences.getInstance();
  final repo = SharedPrefsProfileRepository(prefs);

  runApp(
    ProviderScope(
      overrides: [profileRepositoryProvider.overrideWithValue(repo)],
      child: const MainApp(),
    ),
  );
}

final routeData = {
  '/intro/desc': ViewData(idx: 0, nextRoute: '/intro/streak'),
  '/intro/streak': ViewData(idx: 1, nextRoute: '/intro/choose_profile'),
  '/intro/choose_profile': ViewData(idx: 2, nextRoute: '/strength_test'),
};
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeView()),
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
              GoRoute(
                path: '/main/profile',
                builder: (context, state) => const ProfileSetupView(),
              ),
              GoRoute(
                path: '/main/progress',
                builder: (context, state) => const ProgressView(),
              ),
            ],
          ),
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
});

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
