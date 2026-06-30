import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/core/widgets/large_button.dart';
import 'package:mari_nail_app/features/booking/presentation/pages/date_time_tab.dart';
import 'package:mari_nail_app/features/booking/presentation/pages/staff_booking_tab.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_currentIndex != _tabController.index) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      appBar: AppBarStyle2(
        showNotification: true,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {
          Navigator.pop(context);
        },
        mainText: "New Booking",
        subText: "Select services to build your booking",
      ),
      //
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Stage ${_currentIndex + 1} of 3',
                style: TextStyles.heading2Regular.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: AppColors.primary),
              borderRadius: BorderRadius.circular(15),
              insets: EdgeInsets.symmetric(horizontal: 20),
            ),
            labelStyle: TextStyles.body2Regular.copyWith(
              color: AppColors.secondary,
            ),
            tabs: [
              Tab(text: 'Date and Time'),
              Tab(text: 'Staff'),
              Tab(text: 'Overview'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                //First Tab
                DateTimeTab(),

                // Second Tab //
                StaffBookingTab(),

                //Third Tab
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Review Your Booking',
                                style: TextStyles.body1Medium.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                'Everything look good?   Confirm to secure your booking',
                                style: TextStyles.button1Medium.copyWith(
                                  color: AppColors.secondary,
                                ),
                              ),

                              SizedBox(height: 10),
                              //
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: MediaQuery.of(context).size.height / 8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        PhosphorIcons.calendar,
                                        size: 45,
                                        color: Colors.red,
                                      ),
                                    ),

                                    //
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Date and Time',
                                          style: TextStyle(
                                            color: Color(0xffB43910),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Saturday,July,26,',
                                          style: TextStyles.body2Regular,
                                        ),
                                        SizedBox(height: 8),

                                        Row(
                                          children: [
                                            Text('9:00 AM'),
                                            SizedBox(width: 10),
                                            Text(
                                              '(Total time : 50 mins)',
                                              style: TextStyle(
                                                color: Color(0xffFF9800),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    //
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 15,
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors.primary,
                                          decorationThickness: 2,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // chosen Staff
                              SizedBox(height: 10),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: MediaQuery.of(context).size.height / 8,
                              ),

                              //Service
                              SizedBox(height: 15),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: MediaQuery.of(context).size.height / 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // no.1 Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,

                                        children: [
                                          Text(
                                            'Service',
                                            style: TextStyles.heading2Medium
                                                .copyWith(
                                                  color: AppColors.primary,
                                                ),
                                          ),

                                          Text(
                                            'Total time 50 mins',
                                            style: TextStyle(
                                              color: Color(0xffFF9800),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // no.2 Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,

                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              //
                                              Text(
                                                'Manicure Cleansing',
                                                style: TextStyles.body2Regular,
                                              ),
                                            ],
                                          ),

                                          // pink circle
                                          Text(
                                            '5000 Kyats',
                                            style: TextStyles.body2Regular,
                                          ),
                                        ],
                                      ),

                                      Divider(thickness: 2),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,

                                        children: [
                                          Text(
                                            'Total Charges',
                                            style: TextStyles.body2Regular,
                                          ),
                                          Text(
                                            '5000 Kyats',
                                            style: TextStyles.body2Regular,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              //
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Icon(
                                      PhosphorIcons.exclamationMarkFill,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Please call to the salon at least 1 hour before\nyour appointment if you cannot arrive on time.',
                                      style: TextStyles.body1Medium,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: LargeButton(
                        buttonAction: () {
                          Navigator.pushNamed(
                            context,
                            Routes.bookingSubmitPage,
                          );
                        },
                        lable: 'Confirm Booking',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
