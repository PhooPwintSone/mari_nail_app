import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class SettingsBoxStyle extends StatelessWidget {
  final String boxLable;
  final void Function() naviagteonTap;
  final IconData labelIcon;
  final Color labelColor;
  const SettingsBoxStyle({
    super.key,
    required this.boxLable,
    required this.naviagteonTap,
    required this.labelIcon,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: naviagteonTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.backgroundBG),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundBG,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary,
              offset: Offset(1, 2),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: labelColor,
                  ),

                  child: Icon(labelIcon, color: AppColors.backgroundBG),
                ),
                const SizedBox(width: 20),
                Text(
                  boxLable,
                  style: TextStyles.body2Regular.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
