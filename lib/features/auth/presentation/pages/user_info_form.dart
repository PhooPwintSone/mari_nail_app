import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/app_title_bar.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/core/widgets/my_text_field.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'dart:io';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({super.key});

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final genders = ['Female', 'Male'];
  String? selectedGender;

  File? image;
  final ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();

    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void _submitProfile() async {
    final fullname = _fullnameController.text.trim();
    final username = _usernameController.text.trim();
    final phone = _phoneNumberController.text.trim();

    if (fullname.isEmpty ||
        username.isEmpty ||
        phone.isEmpty ||
        selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required profile text fields.'),
        ),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    final isSuccess = await authProvider.completeUserProfile(
      fullName: fullname,
      userName: username,
      phoneNumber: phone,
      gender: selectedGender!,
      profileImage: image,
    );

    if (!mounted) return;

    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.signInSuccessPage,
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
        title: "Welcome to Mari's Nail Art",
        showBackButton: true,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Let's Create Your Profile",
                    style: TextStyles.heading2Regular.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.cover)
                        : const Icon(Icons.person, size: 100),
                  ),

                  TextButton(
                    onPressed: pickImage,
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyles.textNormal.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 10),

                    MyTextField(
                      hint: 'Enter your full name',
                      obscure: false,
                      controller: _fullnameController,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'User Name',
                      style: TextStyles.textNormal.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 10),

                    MyTextField(
                      hint: 'Enter your User name',
                      obscure: false,
                      controller: _usernameController,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'Phone number',
                      style: TextStyles.textNormal.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 10),

                    MyTextField(
                      hint: 'Fill your phone number',
                      obscure: false,
                      controller: _phoneNumberController,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'Gender',
                      style: TextStyles.textNormal.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundBG,
                          border: Border.all(color: AppColors.secondary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(12),
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            value: selectedGender,
                            hint: Text(
                              'Select your gender',
                              style: TextStyles.textNormal.copyWith(
                                color: AppColors.secondary,
                              ),
                            ),
                            items: genders.map((genderValue) {
                              return DropdownMenuItem<String>(
                                value: genderValue,
                                child: Text(
                                  genderValue,
                                  style: TextStyles.textNormal.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    authLoading
                        ? const Center(child: CircularProgressIndicator())
                        : LargeButton(
                            lable: 'Continue',
                            buttonAction: _submitProfile,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
