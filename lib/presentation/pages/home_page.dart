import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/data/models/category_model.dart';
import 'package:shopit/presentation/bloc/data_bloc/category_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, List<CategoryModel>>(
        builder: (context, categories) {
      if (categories.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/products',
                    arguments: category.name),
                child: Card(
                  child: ListTile(title: Text(category.name)),
                ),
              );
            });
      }
    });
  }
}
