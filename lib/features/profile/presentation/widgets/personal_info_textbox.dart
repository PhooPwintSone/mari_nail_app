import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';

class PersonalInfoTextbox extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hint;

  const PersonalInfoTextbox({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
