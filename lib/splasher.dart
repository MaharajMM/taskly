import 'package:flutter/material.dart';
import 'package:taskly/app/view/app.dart';
import 'package:taskly/bootstrap.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/features/splash/view/splash_view.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: AppColors.kPrimaryColor),
      home: SplashView(
        removeSpalshLoader: false,
        onInitialized: (container) {
          bootstrap(
            () => const App(),
            parent: container,
          );
        },
      ),
    );
  }
}
