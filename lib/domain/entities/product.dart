abstract class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final double? weight;
  final Map<dynamic, dynamic>? dimensions;
  final String? warrantyInfo;
  final String? shippingInfo;
  final String? availableStatus;
  final List<dynamic>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Map<String, dynamic>? meta;
  final List<dynamic>? imageUrl;
  final String? thumbnailUrl;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.tags,
      required this.brand,
      required this.sku,
      required this.weight,
      required this.dimensions,
      required this.warrantyInfo,
      required this.shippingInfo,
      required this.availableStatus,
      required this.reviews,
      required this.returnPolicy,
      required this.minimumOrderQuantity,
      required this.meta,
      required this.imageUrl,
      required this.thumbnailUrl});
}
