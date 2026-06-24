import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';

import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class RecreatePw extends StatelessWidget {
  const RecreatePw({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pwController = TextEditingController();
    final TextEditingController confirmPwController = TextEditingController();

    return Scaffold(
      body: AppTitleBar(
        title: "Forgot Password?",
        showBackButton: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      PhosphorIcons.exclamationMarkFill,
                      color: Colors.red.shade400,
                    ),
                  ),
                  Text(
                    ' Creates strong password with at least 8 characters,\n including a number and a special character.',
                    style: TextStyles.textLight.copyWith(
                      color: AppColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 25),

              Text(
                'New Password',
                style: TextStyles.textNormal.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 10),

              MyTextField(
                hint: 'Create a strong password',
                obscure: true,
                controller: pwController,
              ),
              const SizedBox(height: 10),

              Text(
                'Confirm Password',
                style: TextStyles.textNormal.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 10),

              MyTextField(
                hint: 'Re-enter your password',
                obscure: true,
                controller: confirmPwController,
              ),
              const SizedBox(height: 25),

              LargeButton(
                buttonAction: () {
                  Navigator.pushNamed(context, '/PwResetSucess');
                },
                lable: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
