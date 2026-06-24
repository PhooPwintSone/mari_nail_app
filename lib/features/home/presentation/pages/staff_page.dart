import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/staff_row.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {
          Navigator.pop(context);
        },
        mainText: "Our Staff",
        subText: "Select a staff member to assign to your booking",
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                StaffRow(staffName: 'Chew Chwe'),
                SizedBox(height: 15),
                StaffRow(staffName: 'Yune Yati'),
                SizedBox(height: 15),

                StaffRow(staffName: 'Su Nandar'),
                SizedBox(height: 15),

                StaffRow(staffName: 'Nina Naw'),
                SizedBox(height: 15),

                StaffRow(staffName: 'Hana'),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
