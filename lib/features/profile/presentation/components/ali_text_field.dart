import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/app_colors.dart';

class AliTextFormField extends StatelessWidget {
  const AliTextFormField(
      {super.key,
      required this.controller,
      this.validate,
      this.hint,
      this.isPassword = false,
      this.label,
      this.icon,
      this.suffixIconOnPressed,
      this.inputFormatters});
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final String? Function(String?)? validate;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      cursorColor: AppColors.primary,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.primary),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
