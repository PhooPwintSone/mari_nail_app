import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();

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
        mainText: "Delete Account",
        subText: "",
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              Text(
                'Permanently Delete Acount',
                style: TextStyles.body1Medium.copyWith(
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'If you delete your account,all your porfile details,\nsaved history and data will be permanently removed and\ncannot be recovered.',
                style: TextStyles.button1Medium.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              SizedBox(height: 20),

              Text('Password', style: TextStyles.button1Medium),
              SizedBox(height: 10),

              MyTextField(
                hint: 'Enter your password',
                obscure: true,
                controller: _passwordController,
              ),
              SizedBox(height: 30),

              LargeButton(buttonAction: () {}, lable: 'Continue'),

              //to add another button syle after filling Otp.
            ],
          ),
        ),
      ),
    );
  }
}
