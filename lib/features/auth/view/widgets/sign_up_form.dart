import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taskly/const/colors/app_colors.dart';
import 'package:taskly/features/auth/const/auth_form_keys.dart';
import 'package:taskly/shared/widget/custom_text_formfield.dart';

class SignUpForm extends StatefulWidget {
  final Widget authBtn;
  final GlobalKey<FormBuilderState> formKey;
  const SignUpForm({
    super.key,
    required this.authBtn,
    required this.formKey,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;
  final TextEditingController dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email Field
        const Text(
          'Full Name',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),
        CustomTextFormField(
          name: AuthFormKeys.name,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          hintText: 'John Doe',
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(),
              FormBuilderValidators.firstName(),
            ],
          ),
        ),
        const Text(
          'Email',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),
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

        const Text(
          'Date of Birth',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),

        CustomTextFormField(
          controller: dobController,
          name: AuthFormKeys.dob,
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          hintText: '01/01/2000',
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(),
            ],
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950, 1),
              lastDate: DateTime(2050),
            );
            if (pickedDate != null) {
              String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
              setState(() {
                dobController.text = formattedDate;
              });
              widget.formKey.currentState!.fields[AuthFormKeys.dob]?.setValue(formattedDate);
            }
          },
        ),
        // Phone number field
        const Text(
          'Phone Number',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),

        IntlPhoneField(
          pickerDialogStyle: PickerDialogStyle(
            backgroundColor: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: '0000000000',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE67E22)),
            ),
            hintStyle: GoogleFonts.poppins(
              color: AppColors.grey400,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),

          initialCountryCode: 'IN', // Initial country code (India)
          onChanged: (phone) {
            widget.formKey.currentState!.fields[AuthFormKeys.phone]?.setValue(phone.completeNumber);
          },
        ),

        // Password Field
        const Text(
          'Set Password',
          style: TextStyle(
            color: AppColors.grey600,
            fontSize: 12,
          ),
        ),
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

        // Login Button
        widget.authBtn,
      ],
    );
  }
}
