import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      required this.controller,
      this.isObscure = false,
      this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.changeSuffix,
      this.onChanged,
      this.readOnly = false, required String? Function(dynamic data) validate});
  final String hint;
  final bool readOnly;
  final TextEditingController controller;
  final bool isObscure;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? changeSuffix;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "هذا الحقل مطلوب";
            } else {
              return null;
            }
          },
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      cursorColor: AppColors.primary,
      obscureText: isObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.orange,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.orange,
          ),
        ),
      ),
    );
  }
}
