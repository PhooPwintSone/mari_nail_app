import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/countdown_timer.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/otp_field.dart';
import 'package:mari_nail_app/core/widgets/resend_otp_button.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';

class ForgotOtp extends StatefulWidget {
  const ForgotOtp({super.key});

  @override
  State<ForgotOtp> createState() => _ForgotOtpState();
}

class _ForgotOtpState extends State<ForgotOtp> {
  final GlobalKey<CountdownTimerState> timerKey =
      GlobalKey<CountdownTimerState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleResendOtp() async {
    final authProvider = context.read<AuthProvider>();
    if (authProvider.isLoading) return;

    final email = authProvider.userEmail;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Requesting a new verification code...')),
    );

    final success = await authProvider.sendForgotPasswordOtp(email: email);

    if (!mounted) return;

    if (success) {
      timerKey.currentState?.restart();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('A new OTP has been sent to your email!')),
      );
    } else if (authProvider.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage!),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _navigateToPasswordRecreation() async {
    final enteredOtp = _otpController.text.trim();

    if (enteredOtp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the full 6-digit verification code.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();
    if (authProvider.isLoading) return;

    final success = await authProvider.verifyOtp(otp: enteredOtp);

    if (!mounted) return;

    if (success) {
      Navigator.pushNamed(context, Routes.forgotPwemail);
    } else if (authProvider.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage!),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authLoading = context.watch<AuthProvider>().isLoading;

    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      body: AppTitleBar(
        title: "Forgot Password?",
        showBackButton: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
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
                  completedAction: (value) {
                    if (!authLoading) _navigateToPasswordRecreation();
                  },
                ),
              ),
              const SizedBox(height: 40),
              authLoading
                  ? const Center(child: CircularProgressIndicator())
                  : LargeButton(
                      lable: 'Confirm',
                      buttonAction: _navigateToPasswordRecreation,
                    ),
              const SizedBox(height: 24),
              Center(child: ResendOtpButton(resendAction: _handleResendOtp)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
