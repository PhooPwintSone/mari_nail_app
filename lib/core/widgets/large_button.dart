import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class LargeButton extends StatelessWidget {
  final void Function() buttonAction;
  final String lable;

  const LargeButton({
    super.key,
    required this.buttonAction,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),

        foregroundColor: WidgetStatePropertyAll(AppColors.secondary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      onPressed: buttonAction,
      child: Text(
        lable,
        style: TextStyles.button1Medium.copyWith(color: AppColors.backgroundBG),
      ),
    );
  }
}
