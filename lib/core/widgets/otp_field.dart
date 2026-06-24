import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) completedAction;

  const OtpField({
    super.key,
    required this.controller,
    required this.completedAction,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyles.textNormal.copyWith(color: AppColors.secondary),
      decoration: BoxDecoration(
        color: AppColors.backgroundBG,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary, width: 2),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.backgroundBG,
      border: Border.all(color: AppColors.primary),
    );

    return Center(
      child: Pinput(
        controller: controller, // FIXED: Uses the shared parent controller
        length: 6,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        showCursor: true,
        keyboardType: TextInputType.number,
        autofocus: true,
        onCompleted: (value) =>
            completedAction(value), // FIXED: Hands the 6 digits over
      ),
    );
  }
}
