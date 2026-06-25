import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/countdown_timer.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/otp_field.dart';
import 'package:mari_nail_app/core/widgets/resend_otp_button.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:mari_nail_app/core/routes/routes.dart';

class WelcomeOtp extends StatefulWidget {
  const WelcomeOtp({super.key});

  @override
  State<WelcomeOtp> createState() => _WelcomeOtpState();
}

class _WelcomeOtpState extends State<WelcomeOtp> {
  final GlobalKey<CountdownTimerState> timerKey =
      GlobalKey<CountdownTimerState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleResendOtp(BuildContext context) async {
    final authProvider = context.read<AuthProvider>();
    final email = authProvider.userEmail;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Missing credentials to resend code.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Requesting a new verification code...')),
    );
  }

  void _verifyAndLogin(BuildContext context) async {
    final enteredOtp = _otpController.text.trim();

    if (enteredOtp.isEmpty || enteredOtp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 6-digit OTP code.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    final success = await authProvider.verifyOtp(otp: enteredOtp);

    if (!mounted) return;

    if (success) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.userInfoForm,
        (route) => false,
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

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final authLoading = authProvider.isLoading;

    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      body: AppTitleBar(
        title: "Welcome to Mari's Nail Art",
        showBackButton: true,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                Text(
                  'Please enter the 6-digit code we sent to \n your email address',
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
                            'OTP expired. Please request a new code.',
                          ), // [cite: 95]
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 32),

                OtpField(
                  controller: _otpController,
                  completedAction: (otpCode) {
                    _verifyAndLogin(context);
                  },
                ),
                const SizedBox(height: 24),

                // Confirm button
                authLoading
                    ? const Center(child: CircularProgressIndicator())
                    : LargeButton(
                        lable: 'Confirm',
                        buttonAction: () => _verifyAndLogin(context),
                      ),
                const SizedBox(height: 24),

                ResendOtpButton(resendAction: () => _handleResendOtp(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
