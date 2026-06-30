import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/small_button.dart';
// REMOVED: package:step_progress/step_progress.dart

class BookingSubmitPage extends StatelessWidget {
  const BookingSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentStep = 1;

    final List<String> stepTitles = [
      'Booking Received',
      'Pending Confirmation',
      'Confirmed',
      'Appointment Day',
    ];

    final List<String> stepSubtitles = [
      "Your request has been sent to Mari's Nail salon",
      "The Salon will confirm within 1 hour",
      "You will receive order confirmation notifications",
      "Saturday, July 13 at 9:00 AM",
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text('Booking Submitted', style: TextStyles.heading1Semi),
            const SizedBox(height: 8),
            Text(
              'Booking ID : BK-12345',
              style: TextStyles.button2Regular.copyWith(
                color: AppColors.secondary,
              ),
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
        elevation: 0,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, Color(0xff956970)],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 20,
                        right: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.backgroundBG,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.primary,
                            offset: Offset(-1, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Pending Confirmation',
                                style: TextStyles.button2Regular.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '- 1 hour',
                            style: TextStyles.button2Regular.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // --- APPOINTMENT DETAILS CARD ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appointment Details',
                            style: TextStyles.heading2Medium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Saturday, July 13, 9:00 AM',
                                style: TextStyles.button1Medium.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Nail Artist, Myo Myo',
                                style: TextStyles.button1Medium.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Manicure Cleaning (50 mins)',
                                style: TextStyles.button1Medium.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Charges',
                                style: TextStyles.body1Medium.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                              Text(
                                '5000 Kyats',
                                style: TextStyles.body1Medium.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      'Booking Status',
                      style: TextStyles.body1Medium,
                    ),
                  ),
                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: List.generate(stepTitles.length, (index) {
                        bool isActive = index < currentStep;
                        bool isLast = index == stepTitles.length - 1;

                        bool isNextActive = index < (currentStep - 1);

                        return IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    isActive
                                        ? Icons.check_circle
                                        : Icons.check_circle_outline,
                                    color: AppColors.primary,
                                    size: 30,
                                  ),
                                  if (!isLast)
                                    Expanded(
                                      child: Container(
                                        width: 2,
                                        color: isNextActive
                                            ? Colors.black
                                            : Colors.black,
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2.0,
                                    bottom: 24.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        stepTitles[index],
                                        style: TextStyles.button1Medium
                                            .copyWith(
                                              color: AppColors.secondary,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        stepSubtitles[index],
                                        style: TextStyles.button1Medium
                                            .copyWith(
                                              color: AppColors.secondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 40),

                  Row(
                    children: [
                      SmallButton(label: 'Back to Home', button2Action: () {}),

                      SmallButton(
                        label: 'Countinue Booking',
                        button2Action: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
