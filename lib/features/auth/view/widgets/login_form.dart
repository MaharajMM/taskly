import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/features/auth/const/auth_form_keys.dart';
import 'package:taskly/shared/widget/custom_text_formfield.dart';

class LoginForm extends StatefulWidget {
  final Widget authBtn;
  const LoginForm({
    super.key,
    required this.authBtn,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email Field
        const Text(
          'Email',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          name: AuthFormKeys.email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          hintText: 'Johndoe@gmail.com',
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Password Field
        const Text(
          'Password',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          name: AuthFormKeys.password,
          hintText: '********',
          textInputAction: TextInputAction.done,
          isObscureText: _obscureText,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppColors.grey500,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          maxLine: 1,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6),
          ]),
        ),

        const SizedBox(height: 16),

        // Remember me and Forgot Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: false,
                    activeColor: const Color(0xFFE67E22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(color: Colors.grey.shade400),
                    onChanged: (value) {
                      // setState(() {
                      //   _rememberMe = value ?? false;
                      // });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Remember me',
                  style: TextStyle(
                    color: AppColors.grey600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigate to forgot password
              },
              child: const Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Login Button
        widget.authBtn,

        const SizedBox(height: 20),

        // Or divider
        Row(
          children: [
            Expanded(
              child: Divider(color: Colors.grey.shade300),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: Divider(color: Colors.grey.shade300),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Google Sign In Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {
              // Handle Google sign in
            },
            icon: Image.network(
              'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
              height: 24,
            ),
            label: Text(
              'Continue with Google',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.grey.shade300),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
