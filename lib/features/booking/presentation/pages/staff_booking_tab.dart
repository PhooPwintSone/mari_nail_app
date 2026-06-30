import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/booking/presentation/providers/staff_provider.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/staff_row.dart';

class StaffBookingTab extends StatelessWidget {
  const StaffBookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStaff = context.watch<StaffProvider>().selectedStaff;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                StaffRow(
                  staffName: 'Chew Chwe',
                  child: IconButton(
                    onPressed: () {
                      context.read<StaffProvider>().selectStaff('Chew Chwe');
                    },
                    icon: selectedStaff == 'Chew Chwe'
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 26,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            size: 26,
                            color: AppColors.primary,
                          ),
                  ),
                ),
                const SizedBox(height: 15),

                StaffRow(
                  staffName: 'Yune Yati',
                  child: IconButton(
                    onPressed: () {
                      context.read<StaffProvider>().selectStaff('Yune Yati');
                    },
                    icon: selectedStaff == 'Yune Yati'
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 26,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            size: 26,
                            color: AppColors.primary,
                          ),
                  ),
                ),
                const SizedBox(height: 15),

                StaffRow(
                  staffName: 'Su Nandar',
                  child: IconButton(
                    onPressed: () {
                      context.read<StaffProvider>().selectStaff('Su Nandar');
                    },
                    icon: selectedStaff == 'Su Nandar'
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 26,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            size: 26,
                            color: AppColors.primary,
                          ),
                  ),
                ),
                const SizedBox(height: 15),

                StaffRow(
                  staffName: 'Nina Naw',
                  child: IconButton(
                    onPressed: () {
                      context.read<StaffProvider>().selectStaff('Nina Naw');
                    },
                    icon: selectedStaff == 'Nina Naw'
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 26,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            size: 26,
                            color: AppColors.primary,
                          ),
                  ),
                ),
                const SizedBox(height: 15),

                StaffRow(
                  staffName: 'Hana',
                  child: IconButton(
                    onPressed: () {
                      context.read<StaffProvider>().selectStaff('Hana');
                    },
                    icon: selectedStaff == 'Hana'
                        ? Icon(
                            Icons.check_circle_rounded,
                            size: 26,
                            color: AppColors.primary,
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            size: 26,
                            color: AppColors.primary,
                          ),
                  ),
                ),
                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),

                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary),
                          color: Colors.grey.shade500,
                        ),
                        child: Icon(
                          PhosphorIcons.questionMark,
                          size: 30,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 23),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Any Available Staff'),
                          Text(
                            'Let us choose for you',
                            style: TextStyles.button1Medium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 10),

                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            context.read<StaffProvider>().selectStaff('Any');
                          },
                          icon: selectedStaff == 'Any'
                              ? Icon(
                                  Icons.check_circle_rounded,
                                  size: 26,
                                  color: AppColors.primary,
                                )
                              : const Icon(
                                  Icons.check_circle_outline,
                                  size: 26,
                                  color: AppColors.primary,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: LargeButton(
                    buttonAction: () {
                      if (selectedStaff != null) {
                        print('User selected: $selectedStaff');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a staff member'),
                          ),
                        );
                      }
                    },
                    lable: 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
