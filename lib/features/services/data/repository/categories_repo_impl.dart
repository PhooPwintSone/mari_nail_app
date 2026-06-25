import 'package:mari_nail_app/features/services/data/datasource/categories_datasource.dart';
import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:mari_nail_app/features/services/domain/repository/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesDatasource categoriesDatasource;

  CategoriesRepoImpl({required this.categoriesDatasource});
  @override
  Future<List<CategoryModel>> categoriesList() async {
    try {
      return await categoriesDatasource.categoriesList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
