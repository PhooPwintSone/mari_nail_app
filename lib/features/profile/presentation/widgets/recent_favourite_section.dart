import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/home/presentation/providers/favorite_provider.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/trending/trend_card.dart';
import 'package:provider/provider.dart';

class RecentFavouriteSection extends StatelessWidget {
  const RecentFavouriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // recent Favourite section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Recently Favourite',
                style: TextStyles.heading1Semi.copyWith(
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recentlyFavourite');
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

          // Trending design horizontal list
        ),
        Consumer<FavoriteProvider>(
          builder: (context, provider, child) {
            final favorites = provider.favoriteList;

            if (favorites.isEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 50,
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No favourite designs yet',
                        style: TextStyles.heading2Regular.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final item = favorites[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: TrendCard(
                      trendingModel: item,
                      goToTrendingDesignPage: true,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
