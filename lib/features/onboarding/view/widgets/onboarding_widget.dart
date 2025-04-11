import 'package:flutter/material.dart';
import 'package:taskly/const/app_defaults.dart';
import 'package:taskly/shared/widget/animations/slide_animation_builder.dart';

import '../../../../data/models/onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.data,
  });

  final OnboardingModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            // color: AppColors.kPrimaryColor,
          ),
          width: MediaQuery.of(context).size.width / 0.1,
          height: MediaQuery.of(context).size.height / 3,
          child: Image.asset(
            data.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideAnimationBuilder(
              delay: const Duration(milliseconds: 250),
              child: Text(
                data.headline,
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
              child: SlideAnimationBuilder(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  data.description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
