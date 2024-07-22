import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cat_app/src/presentation/screens/screens.dart';

class AppRouter {
  AppRouter._();

  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String specificationsScreen = '/specifications';

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: specificationsScreen,
        builder: (context, state) => const SpecificationsScreen(),
      ),
    ],
  );
}
