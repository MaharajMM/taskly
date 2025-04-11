import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/features/auth/view/auth_form_view.dart';
import 'package:taskly/shared/widget/buttons/app_primary_btn.dart';

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
                  // Navigate to sign up page
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFFE67E22),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          AuthenticationView(
            authBtn: PrimaryButton(
              labelText: 'Log in',
              onPressed: () {},
            ),
            formKey: _loginFormKey,
            isLogin: true,
          )
        ],
      ),
    );
  }
}
