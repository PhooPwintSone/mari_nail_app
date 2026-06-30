import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class StaffRow extends StatelessWidget {
  final Widget child;
  final String staffName;
  const StaffRow({super.key, required this.staffName, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/user profile.jpg',
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(staffName),
              Text(
                'Nail Artist',
                style: TextStyles.button1Medium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          SizedBox(width: 10),

          Icon(Icons.star, color: Color(0xffF1B019)),
          SizedBox(width: 10),

          Text('4.5'),
          SizedBox(width: 8),

          Text('(100)'),
          SizedBox(width: 10),

          Padding(padding: const EdgeInsets.only(left: 20), child: child),
        ],
      ),
    );
  }
}
