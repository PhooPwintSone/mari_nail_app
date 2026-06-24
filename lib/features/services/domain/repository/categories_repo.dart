import 'package:mari_nail_app/features/services/data/models/categories_models.dart';

abstract interface class CategoriesRepo {
  Future<List<CategoryModel>> categoriesList();
}
