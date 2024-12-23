import 'package:equatable/equatable.dart';
import 'package:shopit/domain/entities/category.dart';

class CategoryModel extends Category with EquatableMixin {
  final String slug;
  final String name;
  final String url;

  CategoryModel({
    required this.slug,
    required this.name,
    required this.url,
  }) : super(
          slug: slug,
          name: name,
          url: url,
        );

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
