import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/small_button.dart';

class StaffRow extends StatelessWidget {
  final String staffName;
  const StaffRow({super.key, required this.staffName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/user profile.jpg',
              width: 70,
              height: 70,
            ),
          ),

          Column(
            children: [
              Text(staffName),
              Text(
                'Nail Atrist',
                style: TextStyles.button2Regular.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          Icon(Icons.star, color: Color(0xffF1B019)),
          Text('4.5'),
          Text('(100)'),
          SmallButton(label: 'Book Now', button2Action: () {}),
        ],
      ),
    );
  }
}
