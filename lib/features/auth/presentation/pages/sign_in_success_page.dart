import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';

class SignInSuccessPage extends StatelessWidget {
  const SignInSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppTitleBar(
        title: "Welcome to Mari's Nail Art",
        showBackButton: false,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' Sign In Successfully',
                      style: TextStyles.heading2Regular.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 25),
                    Icon(
                      Icons.check_circle_outline_sharp,
                      size: 100,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 25),

                    Text(
                      'You have successsfully sign in \n to your account.',
                      style: TextStyles.body2Regular.copyWith(
                        color: AppColors.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              LargeButton(
                lable: 'Go to Home Screen',
                buttonAction: () {
                  Navigator.pushNamed(context, '/nav');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
