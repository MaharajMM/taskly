import 'package:flutter/material.dart';
import 'package:taskly/const/colors/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlack.withValues(alpha: 0.07),
            blurRadius: 20,
            spreadRadius: 8,
          ),
        ],
      ),
      child: child,
    );
  }
}
