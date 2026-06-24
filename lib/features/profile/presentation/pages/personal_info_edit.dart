import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/features/profile/presentation/widgets/personal_info_textbox.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

class _PersonalInfoEditState extends State<PersonalInfoEdit> {
  File? image;
  final ImagePicker picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();

    _gmailController.dispose();
    _genderController.dispose();

    super.dispose();
  }

  //for image Picker
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {
          Navigator.pop(context);
        },
        mainText: "Personal Information",
        subText: "Edit Your Information ",

        //if user edit
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //first column for image and edit
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CircleAvatar(
                    radius: 50,

                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50 - 2,
                      backgroundImage: AssetImage(
                        'assets/images/user profile.jpg',
                      ),
                    ),
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyles.body1Medium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8),

                    PersonalInfoTextbox(
                      controller: _nameController,
                      hint: " Full name",
                      textInputType: TextInputType.name,
                    ),

                    SizedBox(height: 30),

                    Text(
                      'Phone Number',
                      style: TextStyles.body1Medium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8),

                    PersonalInfoTextbox(
                      controller: _phoneController,
                      hint: " Phone number",
                      textInputType: TextInputType.phone,
                    ),

                    SizedBox(height: 30),

                    Text(
                      'Gmail',
                      style: TextStyles.body1Medium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8),

                    PersonalInfoTextbox(
                      controller: _gmailController,
                      hint: " Gmail Address",
                      textInputType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 30),

                    Text(
                      'Gender',
                      style: TextStyles.body1Medium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8),

                    PersonalInfoTextbox(
                      controller: _genderController,
                      hint: " Gender",
                      textInputType: TextInputType.text,
                    ),

                    SizedBox(height: 30),

                    LargeButton(buttonAction: () {}, lable: "Cancel"),
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
