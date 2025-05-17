import 'package:auto_route/auto_route.dart';
import 'package:taskly/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: OnboardingRoute.page,
      path: '/',
      initial: true,
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
      page: HomeRoute.page,
      path: '/home',
    ),
  ];
}
