import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/data/models/product_model.dart';
import 'package:shopit/domain/usecases/data_usecase.dart';

class ProductCubit extends Cubit<List<ProductModel>> {
  final DataUsecase dataUsecase;
  ProductCubit(this.dataUsecase) : super([]);

  Future<void> getProductModels(String category) async {
    final products = await dataUsecase.getProductModels(category);
    emit(products);
  }
}
