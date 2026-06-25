import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ForgotPwemail extends StatefulWidget {
  const ForgotPwemail({super.key});

  @override
  State<ForgotPwemail> createState() => _ForgotPwemailState();
}

class _ForgotPwemailState extends State<ForgotPwemail> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obsureNewPassword = true;
  bool _obsureConfirmPassword = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitNewPassword() async {
    final authProvider = context.read<AuthProvider>();
    if (authProvider.isLoading) return;

    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all password fields.')),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final success = await authProvider.resetPassword(newPassword: newPassword);

    if (!mounted) return;

    if (success) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.pwResetSucess,
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
              const SizedBox(height: 20),
              Text(
                'New Password',
                style: TextStyles.textNormal.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                hint: 'Enter new password',
                obscure: _obsureNewPassword,
                controller: _newPasswordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obsureNewPassword = !_obsureNewPassword;
                    });
                  },
                  icon: Icon(
                    _obsureNewPassword
                        ? PhosphorIcons.eyeClosed
                        : PhosphorIcons.eye,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Confirm New Password',
                style: TextStyles.textNormal.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                hint: 'Confirm your new password',
                obscure: _obsureConfirmPassword,
                controller: _confirmPasswordController,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obsureConfirmPassword = !_obsureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _obsureConfirmPassword
                        ? PhosphorIcons.eyeClosed
                        : PhosphorIcons.eye,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              authLoading
                  ? const Center(child: CircularProgressIndicator())
                  : LargeButton(
                      lable: 'Confirm Reset',
                      buttonAction: _submitNewPassword,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
