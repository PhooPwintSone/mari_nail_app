import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/staff_card.dart';

class StaffSection extends StatelessWidget {
  const StaffSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          //title row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Staff',
                style: TextStyles.heading1Semi.copyWith(
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.staffPage);
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.secondary,
                    decorationThickness: 1,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ],
          ),

          //staff card
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  StaffCard(staffName: 'Chew Chew'),
                  StaffCard(staffName: 'Yune Yati'),
                  StaffCard(staffName: 'Su Nandar'),
                  StaffCard(staffName: 'Nina Naw'),
                  StaffCard(staffName: 'Hana'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
