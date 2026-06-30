import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/features/booking/presentation/widgets/booking_time_grid.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class DateTimeTab extends StatefulWidget {
  const DateTimeTab({super.key});

  @override
  State<DateTimeTab> createState() => _DateTimeTabState();
}

class _DateTimeTabState extends State<DateTimeTab> {
  //selected time
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 300,
                height: 100,
              ),
            ),

            //
            Center(
              child: Text(
                'Choose Your Booking Date And Time',
                style: TextStyles.heading1Reg.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: AppColors.primary,
                      onPrimary: Colors.white,
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2030),
                    onDateChanged: (DateTime value) {
                      print(value);
                    },
                  ),
                ),
              ),
            ),

            //Row
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(PhosphorIcons.exclamationMarkFill, color: Colors.red),
                  Text(
                    'Booking hours: 9:00 AM - 7:30 PM',
                    style: TextStyles.button1Medium,
                  ),
                ],
              ),
            ),

            //
            Padding(
              padding: const EdgeInsets.all(10),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(PhosphorIcons.clockFill, color: AppColors.primary),

                    TextButton(
                      onPressed: () async {
                        final String? pickedTime = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: const EdgeInsets.all(20),
                              child: const BookingTimeGrid(),
                            );
                          },
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                          });
                        }
                      },
                      child: Text(
                        selectedTime ?? 'Select your time',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 17,
                          decoration: selectedTime != null
                              ? TextDecoration.none
                              : TextDecoration.underline,
                          decorationThickness: 1,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: LargeButton(buttonAction: () {}, lable: 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
