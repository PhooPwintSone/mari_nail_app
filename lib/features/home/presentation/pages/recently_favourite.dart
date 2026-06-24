import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/features/home/presentation/providers/favorite_provider.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/trending/trend_card.dart';
import 'package:provider/provider.dart';

class RecentlyFavourite extends StatelessWidget {
  const RecentlyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {},
        mainText: "Recently Favourite",
        subText: "Your saved nail designs are here",
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<FavoriteProvider>(
          builder: (context, provider, child) {
            final favorites = provider.favoriteList;

            return GridView.builder(
              itemCount: favorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final item = favorites[index];

                return TrendCard(
                  trendingModel: item,
                  goToTrendingDesignPage: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
