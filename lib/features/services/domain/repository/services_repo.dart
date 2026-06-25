import 'package:mari_nail_app/features/services/data/models/services_model.dart';

abstract interface class ServicesRepo {
  Future<List<ServicesModel>> getAllservices();
}
