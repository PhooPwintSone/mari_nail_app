import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final Widget? suffixIcon;

  const MyTextField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: AppColors.primary,

        hintText: hint,
        hintStyle: TextStyles.textNormal.copyWith(color: AppColors.secondary),

        filled: true,
        fillColor: AppColors.backgroundBG,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

        suffixIcon: suffixIcon,
      ),
    );
  }
}
