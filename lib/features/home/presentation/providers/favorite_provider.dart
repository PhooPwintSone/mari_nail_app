import 'package:flutter/material.dart';
import 'package:mari_nail_app/features/home/data/model/trending/trending_model.dart';
import 'package:mari_nail_app/features/home/data/trending/trending_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  List<TrendingModel> get trendingList => trending;

  List<TrendingModel> get favoriteList =>
      trending.where((item) => item.isFavorite).toList();

  FavoriteProvider() {
    loadFavorites();
  }

  void toggleFavorite(TrendingModel item) async {
    item.isFavorite = !item.isFavorite;

    await _saveFavorites();

    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final favImages = trending
        .where((item) => item.isFavorite)
        .map((e) => e.image)
        .toList();

    prefs.setStringList('favorites', favImages);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final favImages = prefs.getStringList('favorites') ?? [];

    for (var item in trending) {
      item.isFavorite = favImages.contains(item.image);
    }

    notifyListeners();
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('favorites');

    for (var item in trending) {
      item.isFavorite = false;
    }

    notifyListeners();
  }
}
