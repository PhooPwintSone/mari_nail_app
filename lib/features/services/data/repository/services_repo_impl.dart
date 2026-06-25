import 'package:mari_nail_app/features/services/data/datasource/services_datasource.dart';
import 'package:mari_nail_app/features/services/data/models/services_model.dart';
import 'package:mari_nail_app/features/services/domain/repository/services_repo.dart';

class ServicesRepoImpl implements ServicesRepo {
  final ServicesDatasource servicesDatasource;

  ServicesRepoImpl({required this.servicesDatasource});

  @override
  Future<List<ServicesModel>> getAllservices() async {
    try {
      return await servicesDatasource.getAllservices();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
