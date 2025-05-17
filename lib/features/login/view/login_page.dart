import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/core/router/router.gr.dart';
import 'package:taskly/features/auth/view/auth_form_view.dart';
import 'package:taskly/shared/widget/buttons/app_primary_btn.dart';
import 'package:taskly/shared/widget/custom_card.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Login Title
          const Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Don't have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.grey600),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(SignUpRoute());
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          AuthenticationView(
            authBtn: PrimaryButton(
              labelText: 'Log in',
              onPressed: () {
                context.router.push(NavigationRoute());
              },
            ),
            formKey: _loginFormKey,
            isLogin: true,
          )
        ],
      ),
    );
  }
}
