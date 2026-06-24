import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mari_nail_app/core/configs/app_configs.dart';
import 'package:mari_nail_app/features/services/data/datasource/categories_datasource.dart';
import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesDatasourceImpl implements CategoriesDatasource {
  final http.Client customHttp;
  final SharedPreferences sharedPreferences;

  CategoriesDatasourceImpl({
    required this.customHttp,
    required this.sharedPreferences,
  });

  @override
  Future<List<CategoryModel>> categoriesList() async {
    try {
      final accessToken = sharedPreferences.getString('accessToken');

      final response = await customHttp.get(
        Uri.parse(AppConfigs.categoriesEndpoint),
        headers: {
          'Content-Type': 'application/json',
          if (accessToken != null) 'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body) as List<dynamic>;
        return jsonList
            .map((data) => CategoryModel.fromMap(data as Map<String, dynamic>))
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
