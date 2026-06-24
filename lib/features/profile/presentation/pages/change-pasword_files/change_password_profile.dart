import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ChangePasswordProfile extends StatefulWidget {
  const ChangePasswordProfile({super.key});

  @override
  State<ChangePasswordProfile> createState() => _ChangePasswordProfileState();
}

class _ChangePasswordProfileState extends State<ChangePasswordProfile> {
  final TextEditingController _currentPWController = TextEditingController();

  final TextEditingController _newPWController = TextEditingController();
  final TextEditingController _reEnterPWController = TextEditingController();

  @override
  void dispose() {
    _currentPWController.dispose();
    _newPWController.dispose();
    _reEnterPWController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {
          Navigator.pop(context);
        },
        mainText: "Change Password",
        subText: "Tap To Change Your Password",
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Reset Your Password',
              style: TextStyles.heading1Semi.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 10),

            Text(
              'To Keep your account secure, please choose\na strong new password.',
              style: TextStyles.button1Medium.copyWith(
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: 20),

            Text('Password', style: TextStyles.button1Medium),
            SizedBox(height: 8),

            MyTextField(
              hint: 'Enter your current password',
              obscure: true,
              controller: _currentPWController,
            ),
            SizedBox(height: 10),

            Text('New Password', style: TextStyles.button1Medium),
            SizedBox(height: 8),

            MyTextField(
              hint: 'Create a strong password',
              obscure: true,
              controller: _newPWController,
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(
                    PhosphorIcons.exclamationMarkFill,
                    color: Colors.red.shade400,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Creates strong password with at least 8 characters,\nincluding a number and a special character.',
                    style: TextStyles.textLight.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            Text('Confirm Password', style: TextStyles.button1Medium),
            SizedBox(height: 8),

            MyTextField(
              hint: 'Re-enter your password',
              obscure: true,
              controller: _reEnterPWController,
            ),
            SizedBox(height: 30),

            LargeButton(
              buttonAction: () {
                Navigator.pushNamed(context, Routes.changePwProfileOtp);
              },
              lable: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
