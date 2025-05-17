import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskly/const/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.isReadOnly = false,
    this.isErrorText = false,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.onChanged,
    required this.name,
    this.textInputAction,
    this.controller,
    this.initialValue,
    this.minLine,
    this.maxLine,
    this.errorMaxLine,
    this.fontSize = 12,
    this.hintTexFontSize = 16,
    this.letterSpacing = 0.3,
    this.scrollPhysics,
    this.isTextCapitalization = false,
    this.isObscureText = false,
    this.onFocusGained,
    this.borderRadius,
    this.contentPadding = 12,
    this.valueTransformer,
    this.inputFormatters,
    this.isAlignWithHint = false,
    this.borderColor,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isReadOnly;
  final bool? isErrorText;
  final bool isObscureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final String name;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final int? minLine;
  final int? maxLine;
  final int? errorMaxLine;
  final double fontSize;
  final double? hintTexFontSize;
  final double? letterSpacing;
  final ScrollPhysics? scrollPhysics;
  final bool isTextCapitalization;
  final VoidCallback? onFocusGained;
  final double? borderRadius;
  final double? contentPadding;
  final Function(String?)? valueTransformer;
  final List<TextInputFormatter>? inputFormatters;
  final bool isAlignWithHint;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      inputFormatters: inputFormatters,
      scrollPhysics: scrollPhysics,
      controller: controller,
      name: name,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isReadOnly,
      valueTransformer: valueTransformer,
      enableSuggestions: true,
      enableInteractiveSelection: true,
      // textCapitalization:
      //     isTextCapitalization ? TextCapitalization.words : TextCapitalization.sentences,
      minLines: minLine,
      maxLines: maxLine,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      obscureText: isObscureText,
      style: GoogleFonts.poppins(
        color: AppColors.kBlack,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        alignLabelWithHint: isAlignWithHint,
        hintStyle: GoogleFonts.poppins(
          color: AppColors.grey400,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE67E22)),
        ),
        errorStyle: isErrorText! ? const TextStyle(color: AppColors.kErrorColor) : null,
        errorMaxLines: errorMaxLine,
      ),
    );
  }
}
