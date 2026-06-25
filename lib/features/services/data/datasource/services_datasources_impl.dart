import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mari_nail_app/core/configs/app_configs.dart';
import 'package:mari_nail_app/features/services/data/datasource/services_datasource.dart';
import 'package:mari_nail_app/features/services/data/models/services_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesDatasourcesImpl implements ServicesDatasource {
  final http.Client customHttp;
  final SharedPreferences sharedPreferences;

  ServicesDatasourcesImpl({
    required this.customHttp,
    required this.sharedPreferences,
  });

  @override
  Future<List<ServicesModel>> getAllservices() async {
    try {
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await customHttp.get(
        Uri.parse(AppConfigs.servicesEndpoint),
        headers: {
          'Content-Type': 'application/json',
          if (accessToken != null) 'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body) as List<dynamic>;
        return jsonList
            .map((data) => ServicesModel.fromMap(data as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Failed to load categories. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network or Server Error: $e');
    }
  }
}
