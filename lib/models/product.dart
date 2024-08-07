class Product {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final int stock;
  final int sellingPrice;
  final int buyingPrice;
  final String imageUrl;

  Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.stock,
    required this.sellingPrice,
    required this.buyingPrice,
    required this.imageUrl,
  });
}