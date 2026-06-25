import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:mari_nail_app/features/services/domain/repository/categories_repo.dart';
import 'package:mari_nail_app/features/services/domain/usecase/categories_usecase.dart';

class CategoriesUsecaseImpl implements CategoriesUsecase {
  final CategoriesRepo categoriesRepo;

  CategoriesUsecaseImpl({required this.categoriesRepo});
  @override
  Future<List<CategoryModel>> categoriesList() async {
    try {
      return await categoriesRepo.categoriesList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
