import 'package:go_router/go_router.dart';
import 'package:nawa/core/utils/app_routing/app_paths.dart';
import 'package:nawa/core/utils/app_routing/app_routes_name.dart';

import '../../../presentation/bottom_navigation/bottom_navigation_view.dart';
import '../../../presentation/splash/page/splash_page.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: AppPaths.splash,
    routes: [
      GoRoute(
        path: AppPaths.splash,
        name: AppRoutesName.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppPaths.bottomNavigation,
        name: AppRoutesName.bottomNavigation,
        builder: (context, state) => BottomNavigationView(),
      ),
    ],
  );
}
