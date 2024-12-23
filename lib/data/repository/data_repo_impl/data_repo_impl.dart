import 'package:shopit/data/models/category_model.dart';
import 'package:shopit/data/models/product_model.dart';
import 'package:shopit/data/source/data_repo/data_remote_data_source.dart';
import 'package:shopit/domain/repository/data_repository.dart';

class DataRepoImpl implements DataRepository {
  final DataRemoteDataSource remoteDataSource;


  
  DataRepoImpl({
    required this.remoteDataSource,
  });
  @override
  Future<List<CategoryModel>> getCategoryModels() {
    return remoteDataSource.getCategoryModels();
  }

  @override
  Future<List<ProductModel>> getProductModels(String category) {
    return remoteDataSource.getProductModels(category);
  }
}
