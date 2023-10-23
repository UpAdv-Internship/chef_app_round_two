import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpTextFormField extends StatelessWidget {
  const CustomSignUpTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.lable,
    this.validate,
    this.isPassword = false,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.icon,
    this.suffixIconOnPressed,
    this.readOnly = false,
  });
  final TextEditingController controller;
  final String? hint;
  final String? lable;
  final String? Function(String?)? validate;
  final bool isPassword;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      controller: controller,
      cursorColor: AppColors.primary,
      validator: validate,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        hintText: hint,
        labelText: lable,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
