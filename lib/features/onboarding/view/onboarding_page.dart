import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taskly/const/app_defaults.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/const/resource.dart';
import 'package:taskly/core/router/router.gr.dart';

import '../../../data/models/onboarding_model.dart';
import 'widgets/onboarding_widget.dart';

class OnboardingData {
  static List<OnboardingModel> items = [
    OnboardingModel(
      imageUrl: R.ASSETS_ILLUSTRATIONS_ONBOARDING_1_PNG,
      headline: '📌Stay Organized & Focused',
      description: 'Easily create, manage, and prioritize your tasks to stay on top of your day.',
    ),
    OnboardingModel(
      imageUrl: R.ASSETS_ILLUSTRATIONS_ONBOARDING_2_PNG,
      headline: '⏳ Never Miss a Deadline',
      description: 'Set reminders and due dates to keep track of important tasks effortlessly.',
    ),
    OnboardingModel(
      imageUrl: R.ASSETS_ILLUSTRATIONS_ONBOARDING_3_PNG,
      headline: '✅ Boost Productivity',
      description: 'Break tasks into steps, track progress, and get more done with ease.',
    ),
  ];
}

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingView();
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  late PageController controller;
  List<OnboardingModel> items = OnboardingData.items;

  onPageChange(int value) {
    currentPage = value;
    setState(() {});
  }

  _gotoNextPage() {
    if (currentPage < items.length - 1) {
      controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _gotoLoginSignUp();
    }
  }

  _gotoLoginSignUp() {
    context.navigateTo(LoginBaseRoute());
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            Expanded(
              flex: 8,
              child: PageView.builder(
                onPageChanged: onPageChange,
                itemCount: items.length,
                controller: controller,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  return OnboardingWidget(data: items[index]);
                },
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip button (left)
                  TextButton(
                    onPressed: () {
                      // Skip to the last page
                      controller.animateToPage(
                        items.length - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.kBlack,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Page indicators (middle)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      items.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? AppColors.kPrimaryColor
                              : AppColors.kPrimaryColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Next button (right)
                  ElevatedButton(
                    onPressed: _gotoNextPage,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.kPrimaryColor,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.kwhite,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDefaults.padding),
          ],
        ),
      ),
    );
  }
}
