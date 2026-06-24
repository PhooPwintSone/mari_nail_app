import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/profile/presentation/widgets/settings_box_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Profile Setting',
              style: TextStyles.heading1Semi.copyWith(color: AppColors.primary),
            ),
          ),
          SizedBox(height: 10),

          //for personal information
          SettingsBoxStyle(
            boxLable: 'Personal Information',
            labelColor: AppColors.primary,
            labelIcon: PhosphorIcons.user,
            naviagteonTap: () {
              Navigator.pushNamed(context, Routes.personalInfoEdit);
            },
          ),
        ],
      ),
    );
  }
}
