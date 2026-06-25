import 'package:flutter/material.dart';
import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:mari_nail_app/features/services/data/models/services_model.dart';
import 'package:mari_nail_app/features/services/domain/usecase/categories_usecase.dart';
import 'package:mari_nail_app/features/services/domain/usecase/services_usecase.dart';

class BookingProvider with ChangeNotifier {
  final CategoriesUsecase categoriesUsecase;
  final ServicesUsecase servicesUsecase;

  BookingProvider({
    required this.categoriesUsecase,
    required this.servicesUsecase,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CategoryModel>? _getcategoriesList = [];
  List<CategoryModel>? get getcategoriesList => _getcategoriesList;

  List<ServicesModel>? _servicesList = [];
  List<ServicesModel>? get servicesList => _servicesList;

  Future<void> getCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _getcategoriesList = await categoriesUsecase.categoriesList();
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      throw Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllservices() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _servicesList = await servicesUsecase.getAllservices();
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      throw Exception(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
