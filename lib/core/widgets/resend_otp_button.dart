import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class ResendOtpButton extends StatelessWidget {
  final void Function() resendAction;
  const ResendOtpButton({super.key, required this.resendAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't recvie OTP code?", style: TextStyles.textNormal),
        SizedBox(width: 5),
        TextButton(
          onPressed: resendAction,
          child: Text(
            'resend code',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 15,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ],
    );
  }
}
