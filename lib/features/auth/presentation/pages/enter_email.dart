import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';

class EnterEmail extends StatefulWidget {
  const EnterEmail({super.key});

  @override
  State<EnterEmail> createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendOtp() async {
    final authProvider = context.read<AuthProvider>();
    if (authProvider.isLoading) return;

    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      return;
    }

    final success = await authProvider.sendForgotPasswordOtp(email: email);

    if (!mounted) return;

    if (success) {
      Navigator.pushNamed(context, Routes.forgotOtp);
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Center(
                child: Text(
                  'Enter the email associated with your\naccount and we will send an email to\n change your password.',
                  style: TextStyles.body2Regular.copyWith(
                    color: AppColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  'Gmail',
                  style: TextStyles.textNormal.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MyTextField(
                hint: 'Enter Your Gmail',
                obscure: false,
                controller: _emailController,
              ),
              const SizedBox(height: 25),
              authLoading
                  ? const Center(child: CircularProgressIndicator())
                  : LargeButton(
                      lable: 'Send Verification Code',
                      buttonAction: _handleSendOtp,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
