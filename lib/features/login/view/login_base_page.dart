import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/const/resource.dart';

@RoutePage()
class LoginBasePage extends StatelessWidget {
  const LoginBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.loose,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  Image.asset(R.ASSETS_IMAGES_CENTER_LEFT_ORANGE_BLURRED_PNG),
                  Positioned(
                    right: 0,
                    top: 100,
                    // bottom: 0,
                    child: Image.asset(R.ASSETS_IMAGES_CENTER_RIGHT_ORANGE_BLURRED_PNG),
                  ),
                ],
              ),
            ),

            // const LoginBackgroundImage(),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 60),

                    // Logo
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.kPrimaryColor,
                            child: SvgPicture.asset(
                              height: 20,
                              R.ASSETS_IMAGES_LOGO_ICON_SVG,
                              colorFilter: const ColorFilter.mode(
                                AppColors.kwhite,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'TO-DO',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kPrimaryColor,
                                ),
                          )
                        ],
                      ),
                    ),

                    const AutoRouter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
