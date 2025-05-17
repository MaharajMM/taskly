// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:taskly/features/calender/view/calender_page.dart' as _i1;
import 'package:taskly/features/counter/view/counter_page.dart' deferred as _i2;
import 'package:taskly/features/home/view/home_page.dart' as _i3;
import 'package:taskly/features/login/view/login_base_page.dart' as _i4;
import 'package:taskly/features/login/view/login_page.dart' as _i5;
import 'package:taskly/features/navigation/view/navigation_page.dart' as _i6;
import 'package:taskly/features/notification/view/notification_page.dart'
    as _i7;
import 'package:taskly/features/onboarding/view/onboarding_page.dart' as _i8;
import 'package:taskly/features/profile/view/profile_page.dart' as _i9;
import 'package:taskly/features/sign_up/view/sign_up_page.dart' as _i10;

/// generated route for
/// [_i1.CalenderPage]
class CalenderRoute extends _i11.PageRouteInfo<void> {
  const CalenderRoute({List<_i11.PageRouteInfo>? children})
    : super(CalenderRoute.name, initialChildren: children);

  static const String name = 'CalenderRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalenderPage();
    },
  );
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i11.PageRouteInfo<void> {
  const CounterRoute({List<_i11.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return _i11.DeferredWidget(_i2.loadLibrary, () => _i2.CounterPage());
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoginBasePage]
class LoginBaseRoute extends _i11.PageRouteInfo<void> {
  const LoginBaseRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginBaseRoute.name, initialChildren: children);

  static const String name = 'LoginBaseRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginBasePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.NavigationPage]
class NavigationRoute extends _i11.PageRouteInfo<void> {
  const NavigationRoute({List<_i11.PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.NavigationPage();
    },
  );
}

/// generated route for
/// [_i7.NotificationPage]
class NotificationRoute extends _i11.PageRouteInfo<void> {
  const NotificationRoute({List<_i11.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.NotificationPage();
    },
  );
}

/// generated route for
/// [_i8.OnboardingPage]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfilePage();
    },
  );
}

/// generated route for
/// [_i10.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SignUpPage();
    },
  );
}
