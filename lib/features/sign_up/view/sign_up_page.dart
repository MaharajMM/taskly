import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/features/auth/view/auth_form_view.dart';
import 'package:taskly/shared/widget/buttons/app_primary_btn.dart';
import 'package:taskly/shared/widget/custom_card.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpView();
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _signUpFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.maybePop(),
            icon: Icon(Icons.arrow_back_outlined),
          ),
          // Login Title
          Text(
            'Sign up',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Don't have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Already have an account? ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.grey600),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to sign up page
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          AuthenticationView(
            authBtn: PrimaryButton(
              labelText: 'Register',
              onPressed: () {},
            ),
            formKey: _signUpFormKey,
            isLogin: false,
          )
        ],
      ),
    );
  }
}
