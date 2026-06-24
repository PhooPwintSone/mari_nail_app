import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/notification_badge.dart';

class AppBarStyle2 extends StatelessWidget implements PreferredSizeWidget {
  final bool hasUnreadNotification;
  final VoidCallback onNotificationTap;
  final String mainText;
  final String subText;
  final bool showNotification;
  final void Function() backButtonAction;

  const AppBarStyle2({
    super.key,
    required this.hasUnreadNotification,
    required this.onNotificationTap,
    required this.mainText,
    required this.subText,
    this.showNotification = true,
    required this.backButtonAction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: backButtonAction,
      ),
      leadingWidth: 50,
      titleSpacing: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText,
            style: TextStyles.heading1Semi.copyWith(
              color: AppColors.backgroundBG,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subText,
            style: TextStyles.textNormal.copyWith(color: AppColors.secondary),
          ),
        ],
      ),

      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, Color(0xff956970)],
          ),
        ),
      ),

      actions: showNotification
          ? [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
                  child: NotificationBadge(
                    showBadge: hasUnreadNotification,
                    onTap: onNotificationTap,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.backgroundBG,
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
