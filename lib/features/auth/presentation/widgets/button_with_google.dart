import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class ButtonWithGoogle extends StatelessWidget {
  final void Function() buttonAction;
  final String lable;

  const ButtonWithGoogle({
    super.key,
    required this.buttonAction,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(2.0),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(AppColors.secondary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: buttonAction,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/google.png', width: 30, height: 20),

          Text(
            lable,
            style: TextStyles.button1Medium.copyWith(
              color: AppColors.secondary,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
