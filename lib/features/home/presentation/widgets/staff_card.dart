import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/small_button.dart';

class StaffCard extends StatelessWidget {
  final String staffName;
  const StaffCard({super.key, required this.staffName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 140,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.backgroundBG),
          borderRadius: BorderRadius.circular(15),
          color: AppColors.backgroundBG,
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(-2, 2), blurRadius: 6),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/user profile.jpg',
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(height: 5),

            Text(staffName),
            Text(
              'Nail Atrist',
              style: TextStyles.button2Regular.copyWith(
                color: AppColors.primary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Color(0xffF1B019)),
                SizedBox(width: 5),
                Text('4.5'),
                SizedBox(width: 5),
                Text('(100)'),
              ],
            ),
            SizedBox(height: 8),
            SmallButton(label: 'Book Now', button2Action: () {}),
          ],
        ),
      ),
    );
  }
}
