import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/features/home/data/model/trending/trending_model.dart';
import 'package:mari_nail_app/features/home/presentation/providers/favorite_provider.dart';

import 'package:provider/provider.dart';

class TrendCard extends StatelessWidget {
  final TrendingModel trendingModel;
  final bool goToTrendingDesignPage;
  const TrendCard({
    super.key,
    required this.trendingModel,
    required this.goToTrendingDesignPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GestureDetector(
              onTap: () {
                if (goToTrendingDesignPage == true) {
                  Navigator.pushNamed(context, Routes.trendingDesign);
                }
              },
              // Navigate to the trending design page when the image is tapped
              child: Image.asset(
                trendingModel.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          Positioned(
            top: 10,
            left: 20,
            child: Text(
              'Trending Now',
              style: TextStyles.body1Medium.copyWith(
                color: AppColors.primary,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: const Offset(-1, -1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: GestureDetector(
              onTap: () {
                context.read<FavoriteProvider>().toggleFavorite(trendingModel);
              },
              child: Icon(
                trendingModel.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: AppColors.primary,

                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    offset: const Offset(-1, -1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
