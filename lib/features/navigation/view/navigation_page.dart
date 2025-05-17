import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/const/resource.dart';
import 'package:taskly/core/router/router.gr.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), NotificationRoute(), CalenderRoute(), ProfileRoute()],
      homeIndex: 0,
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            height: 55,
            backgroundColor: AppColors.kwhite,
            shadowColor: Colors.grey[900],
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  R.ASSETS_ICONS_HOME_SVG,
                  height: 23,
                ),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_HOME_SVG,
                  height: 23,
                  colorFilter: ColorFilter.mode(AppColors.grey500, BlendMode.srcIn),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  R.ASSETS_ICONS_NOTIFICATION_SVG,
                  height: 23,
                  colorFilter: ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_NOTIFICATION_SVG,
                  height: 23,
                ),
                label: 'Notification',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  R.ASSETS_ICONS_CALENDAR_SVG,
                  height: 23,
                  colorFilter: ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  R.ASSETS_ICONS_CALENDAR_SVG,
                  height: 23,
                ),
                label: 'Calender',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.person_sharp,
                  color: AppColors.kPrimaryColor,
                  size: 25,
                ),
                icon: Icon(
                  Icons.person_sharp,
                  color: AppColors.customGrey,
                  size: 25,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
