import 'package:mari_nail_app/features/services/data/models/services_model.dart';
import 'package:mari_nail_app/features/services/domain/repository/services_repo.dart';
import 'package:mari_nail_app/features/services/domain/usecase/services_usecase.dart';

class ServicesUsecaseImpl implements ServicesUsecase {
  final ServicesRepo servicesRepo;

  ServicesUsecaseImpl({required this.servicesRepo});
  @override
  Future<List<ServicesModel>> getAllservices() async {
    try {
      return await servicesRepo.getAllservices();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
