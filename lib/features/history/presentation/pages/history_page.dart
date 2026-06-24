import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool hasUnreadNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: true,
        hasUnreadNotification: hasUnreadNotification,
        backButtonAction: () {},

        onNotificationTap: () {
          setState(() {
            hasUnreadNotification = false;
          });
        },
        mainText: "Booking History",
        subText: "All your bookings in one place",
      ),
      body: const Center(child: Text('History Page')),
    );
  }
}
