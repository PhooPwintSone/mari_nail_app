import 'package:flutter/material.dart';
import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:mari_nail_app/features/services/domain/usecase/categories_usecase.dart';

class BookingProvider with ChangeNotifier {
  final CategoriesUsecase categoriesUsecase;

  BookingProvider({required this.categoriesUsecase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CategoryModel>? _categoriesList = [];
  List<CategoryModel>? get categoriesList => _categoriesList;

  Future<void> getCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _categoriesList = await categoriesUsecase.categoriesList();
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
