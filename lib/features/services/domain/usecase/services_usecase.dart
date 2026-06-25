import 'package:mari_nail_app/features/services/data/models/services_model.dart';

abstract class ServicesUsecase {
  Future<List<ServicesModel>> getAllservices();
}
