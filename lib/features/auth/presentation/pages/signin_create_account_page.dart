import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';
import 'package:mari_nail_app/features/auth/presentation/widgets/button_with_google.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class SigninCreateAccountPage extends StatefulWidget {
  const SigninCreateAccountPage({super.key});

  @override
  State<SigninCreateAccountPage> createState() =>
      _SigninCreateAccountPageState();
}

class _SigninCreateAccountPageState extends State<SigninCreateAccountPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  bool _obsurePassword = true;
  bool _obsureConfirmPassword = true;

  bool isSignInPage = true;

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _confirmpwController.dispose();
    super.dispose();
  }

  void _handleSignIn() async {
    final email = _emailController.text.trim();
    final password = _pwController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    await authProvider.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (!mounted) return;
    if (authProvider.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage!),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else if (authProvider.loginResponse != null) {
      Navigator.pushReplacementNamed(context, Routes.nav);
    }
  }

  void _handleSignUp() async {
    final email = _emailController.text.trim();
    final password = _pwController.text.trim();
    final confirmPassword = _confirmpwController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    final success = await authProvider.registerUser(
      email: email,
      password: password,
    );
    if (!mounted) return;
    if (success) {
      Navigator.pushNamed(
        context,
        Routes.welcomeOtp,
        arguments: {'email': email},
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage ?? 'Registration failed'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authLoading = context.watch<AuthProvider>().isLoading;

    final activeStyle = TextButton.styleFrom(
      backgroundColor: Colors.pink.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.pink.shade200),
      ),
    );

    final inactiveStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: AppTitleBar(
            title: "Welcome To Mari's Nail Art",
            showBackButton: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink.shade100),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: isSignInPage ? activeStyle : inactiveStyle,
                          onPressed: () => setState(() => isSignInPage = true),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Sign In Account",
                              style: TextStyles.button1Medium.copyWith(
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: !isSignInPage ? activeStyle : inactiveStyle,
                          onPressed: () => setState(() => isSignInPage = false),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Create Account",
                              style: TextStyles.button1Medium.copyWith(
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Gmail',
                  style: TextStyles.textNormal.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hint: 'Enter your email:',
                  obscure: false,
                  controller: _emailController,
                ),
                const SizedBox(height: 10),
                Text(
                  'Password',
                  style: TextStyles.textNormal.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hint: 'Enter your password :',
                  obscure: _obsurePassword,
                  controller: _pwController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsurePassword = !_obsurePassword;
                      });
                    },
                    icon: Icon(
                      _obsurePassword
                          ? PhosphorIcons.eyeClosed
                          : PhosphorIcons.eye,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (isSignInPage) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.enterEmail);
                    },
                    child: Center(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  authLoading
                      ? const Center(child: CircularProgressIndicator())
                      : LargeButton(
                          lable: 'Log In',
                          buttonAction: _handleSignIn,
                        ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'OR',
                      style: TextStyles.textNormal.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ButtonWithGoogle(
                    buttonAction: () {
                      print('Google button is clicked');
                    },
                    lable: 'Continue with Google',
                  ),
                ] else ...[
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  Text(
                    'Confirm Password',
                    style: TextStyles.textNormal.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    hint: 'Re-enter your password :',
                    obscure: _obsureConfirmPassword,
                    controller: _confirmpwController,
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
                  const SizedBox(height: 20),
                  authLoading
                      ? const Center(child: CircularProgressIndicator())
                      : LargeButton(
                          lable: 'Continue',
                          buttonAction: _handleSignUp,
                        ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
