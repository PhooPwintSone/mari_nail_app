import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/features/home/presentation/providers/favorite_provider.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/trending/trend_card.dart';
import 'package:provider/provider.dart';

class TrendingDesgin extends StatefulWidget {
  const TrendingDesgin({super.key});

  @override
  State<TrendingDesgin> createState() => _TrendingDesginState();
}

class _TrendingDesginState extends State<TrendingDesgin> {
  bool hasUnreadNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        backButtonAction: () {
          Navigator.pop(context);
        },

        onNotificationTap: () {},
        mainText: "Trending Design",
        subText: "Discover trending nail styles for your new look.",
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, provider, child) {
          final list = provider.trendingList;

          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),

              itemCount: list.length,
              itemBuilder: (context, index) {
                final trend = list[index];

                return TrendCard(
                  trendingModel: trend,
                  goToTrendingDesignPage: false,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
