import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/core/widgets/countdown_timer.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/otp_field.dart';
import 'package:mari_nail_app/core/widgets/resend_otp_button.dart';

class ChangePwProfileOtp extends StatefulWidget {
  const ChangePwProfileOtp({super.key});

  @override
  State<ChangePwProfileOtp> createState() => _ChangePwProfileOtpState();
}

class _ChangePwProfileOtpState extends State<ChangePwProfileOtp> {
  final GlobalKey<CountdownTimerState> timerKey =
      GlobalKey<CountdownTimerState>();

  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
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
          print('back action button');
        },
        mainText: "Change Password",
        subText: "Confirm Your Verification Code",
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            Text(
              'Please enter the 6-digit code we send to \n your email address',
              style: TextStyles.body2Regular.copyWith(
                color: AppColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: CountdownTimer(
                key: timerKey,
                initialSeconds: 300,
                onFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'OTP expired. Please click resend to get a new code.',
                      ),
                      backgroundColor: Colors.orange,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: OtpField(
                controller: _otpController,
                completedAction: (value) {},
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LargeButton(
                lable: 'Send Verificaton Code',
                //After filling Otp, label will change to 'Confirm'
                //Still need Show Dialog
                buttonAction: () {},
              ),
            ),
            const SizedBox(height: 24),
            Center(child: ResendOtpButton(resendAction: () {})),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
