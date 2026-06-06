class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String category;
  int quantity;
 
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.category,
    this.quantity = 1,
  });
}
 