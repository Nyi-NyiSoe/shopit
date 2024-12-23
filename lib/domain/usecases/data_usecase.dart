import 'package:shopit/data/models/category_model.dart';
import 'package:shopit/data/models/product_model.dart';
import 'package:shopit/domain/repository/data_repository.dart';

class DataUsecase {
  final DataRepository repository;

  DataUsecase(this.repository);

  Future<List<CategoryModel>> getCategoryModels() async {
    return await repository.getCategoryModels();
  }

  Future<List<ProductModel>> getProductModels(String category) async {
    return await repository.getProductModels(category);
  }
}
