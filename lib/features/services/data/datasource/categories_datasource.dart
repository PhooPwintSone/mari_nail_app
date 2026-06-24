import 'package:mari_nail_app/features/services/data/models/categories_models.dart';

abstract interface class CategoriesDatasource {
  Future<List<CategoryModel>> categoriesList();
}
