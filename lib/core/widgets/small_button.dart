import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class SmallButton extends StatelessWidget {
  final void Function() button2Action;
  final String label;
  const SmallButton({
    super.key,
    required this.label,
    required this.button2Action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),

        elevation: WidgetStatePropertyAll(0),
      ),

      onPressed: button2Action,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          label,
          style: TextStyles.button1Medium.copyWith(
            color: AppColors.backgroundBG,
          ),
        ),
      ),
    );
  }
}
