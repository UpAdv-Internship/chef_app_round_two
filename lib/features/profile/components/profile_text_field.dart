import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.keyboardType,
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(color: AppColors.grey),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
