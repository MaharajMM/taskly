import 'package:flutter/widgets.dart';
import 'package:taskly/const/borders/app_borders.dart';
import 'package:taskly/const/colors/app_colors.dart';

class CustomThemeCard extends StatelessWidget {
  final Widget child;
  final GlobalKey globalKey;
  const CustomThemeCard({
    super.key,
    required this.child,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      // height: 400,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: AppBorder.kFullMiddleCurve,
        gradient: LinearGradient(
          colors: [
            AppColors.kPrimaryColor.withValues(alpha: 0.95),
            AppColors.kPrimaryColor.withValues(alpha: 1.0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlack.withValues(alpha: 0.3), // Darker shadow for depth
            blurRadius: 30, // Increased blur for smooth effect
            offset: const Offset(10, 20), // Bigger offset for elevation
          ),
          BoxShadow(
            color: AppColors.kBlack.withValues(alpha: 0.15), // Lighter shadow for realism
            blurRadius: 15,
            offset: const Offset(-5, -5), // Soft top-left shadow for floating feel
          ),
        ],
      ),
      child: child,
    );
  }
}
