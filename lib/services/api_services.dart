import 'package:dio/dio.dart';
import 'package:test_stacked_mvvm/models/Recipes.dart';

class ApiService {
  final _dio = Dio();

  Future<List<Recipes>> fetchRecipes() async {
    const String url = 'https://dummyjson.com/recipes';
    try {
      final res = await _dio.get(url);

      final List<dynamic> rJson = res.data['recipes'] as List<dynamic>;

      final rList = rJson.map((recipe) => Recipes.fromJson(recipe)).toList();

      return rList;
    } catch (e) {
      print('Error: $e');

      return [];
    }
  }
}
