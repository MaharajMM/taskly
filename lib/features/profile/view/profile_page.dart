import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/const/resource.dart';
import 'package:taskly/features/profile/view/widgets/profile_option_widget.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF6E7F), // coral
                  Color(0xFFFFB88C), // soft peach
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Profile header with background gradient
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.13,
                  width: double.infinity,
                ),

                // Profile picture (positioned to overlap with gradient)
                Transform.translate(
                  offset: const Offset(0, -60),
                  child: Column(
                    children: [
                      // Profile picture with edit button
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.kBlack.withValues(alpha: 0.07),
                                  blurRadius: 20,
                                  spreadRadius: 8,
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                R.ASSETS_ICONS_PENCIL_SVG,
                                colorFilter: ColorFilter.mode(AppColors.kwhite, BlendMode.srcIn),
                                height: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Name and title
                      Column(
                        children: [
                          Text(
                            "John Doe",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Flutter Developer",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Profile options
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      ProfileOptionWidget(
                        icon: R.ASSETS_ICONS_PENCIL_SVG,
                        label: 'Edit Profile',
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      ProfileOptionWidget(
                        icon: R.ASSETS_ICONS_PASSWORD_SVG,
                        label: 'Change Password',
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      ProfileOptionWidget(
                        icon: R.ASSETS_ICONS_LOGOUT_SVG,
                        label: 'Log out',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
