import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:taskly/features/auth/view/widgets/login_form.dart';

class AuthenticationView extends StatelessWidget {
  final bool isLogin;
  final Widget authBtn;
  final GlobalKey<FormBuilderState> formKey;
  const AuthenticationView({
    super.key,
    this.isLogin = false,
    required this.authBtn,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: isLogin ? LoginForm(authBtn: authBtn) : Container(),
    );
  }
}
