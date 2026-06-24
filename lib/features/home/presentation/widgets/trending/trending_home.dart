import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/home/presentation/providers/favorite_provider.dart';
import 'package:mari_nail_app/features/home/presentation/widgets/trending/trend_card.dart';
import 'package:provider/provider.dart';

class TrendingHome extends StatelessWidget {
  const TrendingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          //title and see all Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Trending Now',
                style: TextStyles.heading1Semi.copyWith(
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.trendingDesign);
                  print('Go to Trending Design');
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
          Consumer<FavoriteProvider>(
            builder: (context, favoriteProvider, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoriteProvider.trendingList.length,
                  itemBuilder: (context, index) {
                    final trend = favoriteProvider.trendingList[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: TrendCard(
                        trendingModel: trend,
                        goToTrendingDesignPage: true,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
