class Product {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final double sellingPrice;
  final double buyingPrice;
  final String imageUrl;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.sellingPrice,
    required this.buyingPrice,
    required this.imageUrl,
  });
}