import 'package:auto_route/auto_route.dart';
import 'package:taskly/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/on',
    ),
    AdaptiveRoute(
      page: LoginBaseRoute.page,
      path: '/base',
      children: [
        RedirectRoute(
          path: '',
          redirectTo: 'login',
        ),
        AdaptiveRoute(
          page: LoginRoute.page,
          path: 'login',
        ),
        AdaptiveRoute(
          page: SignUpRoute.page,
          path: 'sign-up',
        ),
      ],
    ),
    AutoRoute(
      page: NavigationRoute.page,
      // path: '/navigation',
      path: '/',
      initial: true,
      children: [
        RedirectRoute(
          path: '',
          redirectTo: 'home',
        ),
        AdaptiveRoute(
          page: HomeRoute.page,
          path: 'home',
        ),
        AdaptiveRoute(
          page: NotificationRoute.page,
          path: 'notification',
        ),
        AdaptiveRoute(
          page: CalenderRoute.page,
          path: 'calender',
        ),
        AdaptiveRoute(
          page: ProfileRoute.page,
          path: 'profile',
        ),
      ],
    ),
  ];
}
