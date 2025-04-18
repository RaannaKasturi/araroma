import 'package:araroma/model/category.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories.g.dart';

class Categories {
  Future<List<Category>> getCategories() async {
    final apiUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    final response = await Dio().get(apiUrl);

    if (response.statusCode == 200 &&
        response.data != null &&
        response.data['categories'] != null) {
      final List categoriesRaw = response.data['categories'];
      return categoriesRaw
          .map((item) => Category.fromMap(item))
          .toList(growable: false);
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

@Riverpod(keepAlive: true)
Future<List<Category>> getcategoriesData(ref) async {
  return await Categories().getCategories();
}
