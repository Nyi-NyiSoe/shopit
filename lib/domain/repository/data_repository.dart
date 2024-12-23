import 'package:shopit/data/models/category_model.dart';
import 'package:shopit/data/models/product_model.dart';

abstract class DataRepository {
  Future<List<CategoryModel>> getCategoryModels();
  Future<List<ProductModel>> getProductModels(String category);
  
}
