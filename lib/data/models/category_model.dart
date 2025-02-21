import 'package:equatable/equatable.dart';
import 'package:shopit/domain/entities/category.dart';

class CategoryModel extends Category with EquatableMixin {
  CategoryModel({
    required super.slug,
    required super.name,
    required super.url,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [slug, name, url];
}
