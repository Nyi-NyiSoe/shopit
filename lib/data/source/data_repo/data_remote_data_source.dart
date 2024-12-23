import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopit/data/models/category_model.dart';
import 'package:shopit/data/models/product_model.dart';

class DataRemoteDataSource {
  final _categoryURL = 'https://dummyjson.com/products/categories';
  final _productURL = 'https://dummyjson.com/products/category';

  Future<List<CategoryModel>> getCategoryModels() async {
    try {
      final response = await http.get(Uri.parse(_categoryURL));
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body);
        print(jsonRes);
        return List<CategoryModel>.from(
            jsonRes.map((category) => CategoryModel.fromJson(category)));

          
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<List<ProductModel>> getProductModels(String category) async {
    try {
      final response = await http.get(Uri.parse('$_productURL/$category'));
      if (response.statusCode == 200) {
        final jsonRes = jsonDecode(response.body);
        print(jsonRes);
        return List<ProductModel>.from(
            jsonRes.map((product) => ProductModel.fromJson(product)));
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to fetch products');
    }
  }
}
