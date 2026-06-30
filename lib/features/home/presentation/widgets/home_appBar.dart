import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/notification_badge.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasUnreadNotification;
  final VoidCallback onNotificationTap;
  final VoidCallback onProfileTap;

  const HomeAppBar({
    super.key,
    required this.hasUnreadNotification,
    required this.onNotificationTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    final userName = authProvider.userFullName;
    String getGreeting() {
      final int hour = DateTime.now().hour;

      if (hour < 12) {
        return 'Good Morning';
      } else if (hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    return AppBar(
      toolbarHeight: 100,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(getGreeting(), style: TextStyles.textNormal),
          const SizedBox(height: 8),

          Text(userName, style: TextStyles.heading2Regular),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        // notification
        Align(
          alignment: Alignment.center,
          child: NotificationBadge(
            showBadge: hasUnreadNotification,
            onTap: onNotificationTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8, top: 8),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.backgroundBG,
                ),
                child: Icon(Icons.notifications, color: AppColors.secondary),
              ),
            ),
          ),
        ),

        //user photo if user clicked, it will bring to profile info page
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8, top: 8),
            child: GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.backgroundBG,
                ),
                child: Image.asset(
                  'assets/images/sample profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, Color(0xff956970)],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
