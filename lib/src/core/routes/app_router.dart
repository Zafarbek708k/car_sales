import "package:car_sales/src/feature/auth/presentation/pages/login_page.dart";
import "package:car_sales/src/feature/auth/presentation/pages/register_page.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../feature/home/presentation/pages/home_page.dart";
import "../../feature/splash/presentation/pages/splash_page.dart";
import "app_route_name.dart";

final class AppRouter{


  static GoRouter router = GoRouter(
      initialLocation: AppRouteName.splashPage,
      routes: <RouteBase>[
        // splash
        GoRoute(
          path: AppRouteName.splashPage,
          builder: (BuildContext context, GoRouterState state) => const SplashPage(),
        ),
        // Auth
        GoRoute(
          path: AppRouteName.loginPage,
          builder: (BuildContext context, GoRouterState state) => const LoginPage(),
          routes: [
            GoRoute(
              path: AppRouteName.registerPage,
              builder: (BuildContext context, GoRouterState state) => const RegisterPage(),
            ),
          ]
        ),
        // home
        GoRoute(
          path: AppRouteName.homePage,
          builder: (BuildContext context, GoRouterState state) => const HomePage(),
        ),
      ]
  );
}