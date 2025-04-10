// ignore_for_file: deprecated_member_use

import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/core/router/auto_route_observer.dart';
import 'package:taskly/core/router/router_pod.dart';
import 'package:taskly/core/theme/app_theme.dart';
import 'package:taskly/core/theme/theme_controller.dart';
import 'package:taskly/i18n/strings.g.dart';
import 'package:taskly/shared/helper/global_helper.dart';
import 'package:taskly/shared/pods/translation_pod.dart';
import 'package:taskly/shared/widget/no_internet_widget.dart';
import 'package:taskly/shared/widget/responsive_wrapper.dart';

///This class holds Material App or Cupertino App
///with routing,theming and locale setup .
///Also responsive framerwork used for responsive application
///which auto resize or autoscale the app.
class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with GlobalHelper {
  @override
  Widget build(BuildContext context) {
    final approuter = ref.watch(autorouterProvider);
    final currentTheme = ref.watch(themecontrollerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Taskly',
      theme: Themes.theme,
      // darkTheme: Themes.darkTheme,
      themeMode: currentTheme,
      routerConfig: approuter.config(
        placeholder: (context) => const SizedBox.shrink(),
        navigatorObservers: () => [
          RouterObserver(),
        ],
      ),
      locale: ref.watch(translationsPod).$meta.locale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: (context, child) {
        if (mounted) {
          ///Used for responsive design
          ///Here you can define breakpoint and how the responsive should work
          child = ResponsiveBreakPointWrapper(
            firstFrameWidget: Container(
              color: Colors.white,
            ),
            child: child!,
          );

          /// Add support for maximum text scale according to changes in
          /// accessibilty in sytem settings
          final mediaquery = MediaQuery.of(context);
          child = MediaQuery(
            data: mediaquery.copyWith(
              textScaler: TextScaler.linear(mediaquery.textScaleFactor.clamp(0, 1)),
            ),
            child: child,
          );

          /// Added annotate region by default to switch according to theme which
          /// customize the system ui veray style
          child = AnnotatedRegion<SystemUiOverlayStyle>(
            value: currentTheme == ThemeMode.light
                ? SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.black,
                    systemNavigationBarColor: Colors.black,
                    systemNavigationBarDividerColor: Colors.black,
                    systemNavigationBarIconBrightness: Brightness.dark,
                  )
                : currentTheme == ThemeMode.light
                    ? SystemUiOverlayStyle.dark.copyWith(
                        statusBarColor: Colors.transparent,
                        systemNavigationBarColor: AppColors.grey200,
                        systemNavigationBarDividerColor: AppColors.grey200,
                        systemNavigationBarIconBrightness: Brightness.light,
                      )
                    : SystemUiOverlayStyle.dark.copyWith(
                        statusBarColor: AppColors.kPrimaryColor,
                        systemNavigationBarColor: AppColors.kPrimaryBgColor,
                        systemNavigationBarDividerColor: AppColors.kPrimaryBgColor,
                        systemNavigationBarIconBrightness: Brightness.light,
                      ),
            child: GestureDetector(
              child: child,
              onTap: () {
                hideKeyboard();
              },
            ),
          );
        } else {
          child = const SizedBox.shrink();
        }

        ///Add toast support for flash
        return Toast(
          navigatorKey: navigatorKey,
          child: child,
        ).monitorConnection();
      },
    );
  }
}
