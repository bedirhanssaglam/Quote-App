import 'package:auto_route/auto_route.dart';
import 'package:bloc_pattern/view/quotes/quote_screen.dart';
import 'package:bloc_pattern/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen|View,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: SplashScreen, initial: true),
    AutoRoute(path: 'quote', page: QuoteScreen),
  ],
)
class AppRouter extends _$AppRouter {}
