import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/data/models/category_model.dart';
import 'package:shopit/domain/usecases/data_usecase.dart';

class CategoryCubit extends Cubit<List<CategoryModel>>{
  CategoryCubit(this.dataUsecase) : super([]);

  final DataUsecase dataUsecase;

  Future<void> getCategoryModels() async {
   try{
     final categories = await dataUsecase.getCategoryModels();
    emit(categories);
   }catch(e){
     print(e);
   }
  }

}