import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/features/home/presentation/pages/staff_section.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/home_appBar.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/promo_cards.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/services/servies_categories.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/trending/trending_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasUnreadNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      appBar: HomeAppBar(
        hasUnreadNotification: hasUnreadNotification,
        onNotificationTap: () {
          setState(() {
            hasUnreadNotification = false;
          });
          print("Notification clicked");
        },
        onProfileTap: () {
          print("Profile clicked");
        },
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,

          children: [
            PromoCards(),
            const SizedBox(height: 5),

            ServiesCategories(),
            const SizedBox(height: 5),

            TrendingHome(),
            const SizedBox(height: 5),

            //staff section
            StaffSection(),
            const SizedBox(height: 5),

            //booking section
          ],
        ),
      ),
    );
  }
}
