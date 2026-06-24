import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/features/profile/presentation/widgets/settings_box_style.dart';
import 'package:mari_nail_app/features/profile/presentation/widgets/personal_info_section.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:mari_nail_app/features/profile/presentation/widgets/recent_favourite_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool hasUnreadNotification = true;

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 50.0;

    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {
          print('back action button');
        },
        mainText: "Profile",
        subText: "Manage personal info, password and security",
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final userEmail = authProvider.userEmail.isNotEmpty
              ? authProvider.userEmail
              : 'userSample@gmail.com';
          final userName = authProvider.userFullName.isNotEmpty
              ? authProvider.userFullName
              : 'User Name';

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    // 1. Background Card
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.only(top: avatarRadius),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: avatarRadius + 16,
                          bottom: 24,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              userName,
                              style: TextStyles.heading1Semi.copyWith(
                                color: AppColors.backgroundBG,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              userEmail,
                              style: TextStyles.body2Regular.copyWith(
                                color: AppColors.secondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 2. Profile Image Layer
                    const Positioned(
                      top: 0,
                      child: CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: avatarRadius - 2,
                          backgroundImage: AssetImage(
                            'assets/images/user profile.jpg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //reccent favourite section
                const RecentFavouriteSection(),

                //personal information section
                const PersonalInfoSection(),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                    top: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Settings',
                          style: TextStyles.heading1Semi.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),

                      SettingsBoxStyle(
                        boxLable: 'Change Phone Number',
                        labelColor: Color(0xff956970),
                        labelIcon: PhosphorIcons.deviceMobileCamera,
                        naviagteonTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.changePhoneNumber,
                          );
                        },
                      ),

                      SizedBox(height: 8),
                      SettingsBoxStyle(
                        boxLable: 'Change Password',
                        labelColor: Color(0xffC6A14B),
                        labelIcon: PhosphorIcons.lock,
                        naviagteonTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.changePasswordProfile,
                          );
                        },
                      ),

                      SizedBox(height: 8),
                      SettingsBoxStyle(
                        boxLable: 'Language',
                        labelColor: Color(0xff47CDEB),
                        labelIcon: PhosphorIcons.globe,
                        naviagteonTap: () {
                          Navigator.pushNamed(context, Routes.languagePage);
                        },
                      ),
                      SizedBox(height: 8),
                      SettingsBoxStyle(
                        boxLable: 'Terms and Conditions',
                        labelColor: Color(0xffA0553C),
                        labelIcon: PhosphorIcons.note,
                        naviagteonTap: () {
                          Navigator.pushNamed(context, Routes.termsConditions);
                        },
                      ),
                      SizedBox(height: 8),
                      SettingsBoxStyle(
                        boxLable: 'Privacy and Security',
                        labelColor: Color(0xffC6A14B),
                        labelIcon: PhosphorIcons.shieldCheck,
                        naviagteonTap: () {
                          Navigator.pushNamed(context, Routes.privacySecurity);
                        },
                      ),
                      SizedBox(height: 8),
                      SettingsBoxStyle(
                        boxLable: 'Delete Account',
                        labelColor: Color(0xffE94D4D),
                        labelIcon: PhosphorIcons.trash,
                        naviagteonTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.deleteAccountPage,
                          );
                        },
                      ),

                      SizedBox(height: 30),

                      LargeButton(buttonAction: () {}, lable: "Log Out"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
