import 'package:equatable/equatable.dart';
import 'package:shopit/domain/entities/product.dart';

class ProductModel extends Product with EquatableMixin {

  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    required super.brand,
    required super.sku,
    required super.weight,
    required super.dimensions,
    required super.warrantyInfo,
    required super.shippingInfo,
    required super.availableStatus,
    required super.reviews,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.meta,
    required super.imageUrl,
    required super.thumbnailUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'] ?? 0.0,
      discountPercentage: (json['discountPercentage'] is int)
          ? (json['discountPercentage'] as int).toDouble()
          : json['discountPercentage'] ?? 0.0,
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'] ?? 0.0,
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags']) ?? [],
      brand: json['brand'] ?? '-',
      sku: json['sku'] ?? '',
      weight: (json['weight'] is int)
          ? (json['weight'] as int).toDouble()
          : json['weight'] ?? 0.0,
      dimensions: json['dimensions'].map<dynamic, dynamic>(
              (key, value) => MapEntry(key, value.toDouble())) ??
          {},
      warrantyInfo: json['warrantyInformation'] ?? '',
      shippingInfo: json['shippingInformation'] ?? '',
      availableStatus: json['availabilityStatus'] ?? '',
      reviews: List<dynamic>.from(json['reviews']) ?? [],
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
      meta: Map<String, String>.from(json['meta']) ?? {},
      imageUrl: List<dynamic>.from(json['images']) ?? [],
      thumbnailUrl: json['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions,
      'warrantyInformation': warrantyInfo,
      'shippingInformation': shippingInfo,
      'availabilityStatus': availableStatus,
      'reviews': reviews,
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta,
      'images': imageUrl,
      'thumbnail': thumbnailUrl,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        price,
        discountPercentage,
        rating,
        stock,
        tags,
        brand,
        sku,
        weight,
        dimensions,
        warrantyInfo,
        shippingInfo,
        availableStatus,
        reviews,
        returnPolicy,
        minimumOrderQuantity,
        meta,
        imageUrl,
        thumbnailUrl,
      ];
}
