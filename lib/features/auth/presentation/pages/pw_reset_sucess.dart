import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';

class PwResetSucess extends StatelessWidget {
  const PwResetSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTitleBar(
        title: "Password Reset Successful",
        showBackButton: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.check_circle_outline_sharp,
                size: 100,
                color: AppColors.primary,
              ),

              SizedBox(height: 20),
              Text(
                'Your password has been updated\n successfully. You can log in with\n your new password now.',
                style: TextStyles.body1Medium.copyWith(
                  color: AppColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              LargeButton(
                lable: 'Continue to login',
                buttonAction: () {
                  Navigator.pushNamed(context, '/signin_create_account_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
