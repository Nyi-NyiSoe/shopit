abstract class Category {
  final String slug;
  final String name;
  final String url;

  Category({required this.slug, required this.name, required this.url});

  @override
  String toString() {
    return 'Category{slug: $slug, name: $name, url: $url}';
  }
}
