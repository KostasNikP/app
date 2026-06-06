import 'package:shop_app/auth/models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Shop extends ChangeNotifier {
  // Products for sale
  final List<Product> _shop = [
    // Trend
    Product(
      id: 1,
      name: "iPhone 11",
      price: 499.99,
      description: "6.1-inch Liquid Retina display, A13 Bionic chip, dual 12MP camera system.",
      imagePath: 'photo/Iphone11.png',
      category: 'trend',
    ),
    Product(
      id: 2,
      name: "iPhone 12",
      price: 599.99,
      description: "5G capable, Super Retina XDR display, Ceramic Shield front cover.",
      imagePath: 'photo/Iphone12.png',
      category: 'trend',
    ),
    Product(
      id: 3,
      name: "iPhone 13",
      price: 699.99,
      description: "Advanced dual-camera system, A15 Bionic chip, all-day battery life.",
      imagePath: 'photo/Ipone13.png',
      category: 'trend',
    ),
    Product(
      id: 4,
      name: "iPhone 14",
      price: 799.99,
      description: "Crash Detection, Emergency SOS via satellite, 48MP main camera.",
      imagePath: 'photo/Ipone14.png',
      category: 'trend',
    ),

    // Discount
    Product(
      id: 5,
      name: "iPhone 15",
      price: 849.99,
      description: "USB-C connector, Dynamic Island, 48MP main camera with 2x Telephoto.",
      imagePath: 'photo/Iphone15.png',
      category: 'discount',
    ),
    Product(
      id: 6,
      name: "AirPods Pro",
      price: 199.99,
      description: "Active Noise Cancellation, Adaptive Transparency, Personalised Spatial Audio.",
      imagePath: 'photo/Iphone15.png',
      category: 'discount',
    ),
    Product(
      id: 7,
      name: "Apple Watch SE",
      price: 249.99,
      description: "Heart rate notifications, Emergency SOS, crash detection, 18h battery.",
      imagePath: 'photo/Iphone15.png',
      category: 'discount',
    ),
    Product(
      id: 8,
      name: "iPad Air",
      price: 599.99,
      description: "M1 chip, 10.9-inch Liquid Retina display, Touch ID, 5G connectivity.",
      imagePath: 'photo/Iphone15.png',
      category: 'discount',
    ),

    // Other
    Product(
      id: 9,
      name: "MacBook Air M2",
      price: 1099.99,
      description: "M2 chip, 13.6-inch Liquid Retina display, 18-hour battery, fanless design.",
      imagePath: 'photo/photo2.jpg',
      category: 'other',
    ),
    Product(
      id: 10,
      name: "Apple TV 4K",
      price: 129.99,
      description: "A15 Bionic chip, 4K HDR with Dolby Vision, HDR10+, thread networking.",
      imagePath: 'photo/photo2.jpg',
      category: 'other',
    ),
    Product(
      id: 11,
      name: "MagSafe Charger",
      price: 39.99,
      description: "Perfectly aligned magnetic charging up to 15W for iPhone 12 and later.",
      imagePath: 'photo/photo2.jpg',
      category: 'other',
    ),
    Product(
      id: 12,
      name: "Apple Pencil 2nd Gen",
      price: 89.99,
      description: "Pixel-perfect precision, low latency, magnetic attachment and wireless charging.",
      imagePath: 'photo/photo2.jpg',
      category: 'other',
    ),
  ];

  // User cart
  final List<Product> _cart = [];

  // Get product list
  List<Product> get shop => _shop;

  // Get products by category
  List<Product> getByCategory(String category) =>
      _shop.where((p) => p.category == category).toList();

  // Get user cart
  List<Product> get cart => _cart;

  // Add item to cart
  void addToCart(int id, Product product) {
    final existingIndex =
        _cart.indexWhere((e) => e.id == id && e.name == product.name);

    if (existingIndex != -1) {
      _cart[existingIndex].quantity++;
    } else {
      _cart.add(Product(
        id: id,
        name: product.name,
        price: product.price,
        description: product.description,
        imagePath: product.imagePath,
        category: product.category,
      ));
    }
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    final cartIndex =
        _cart.indexWhere((e) => e.name == item.name && e.id == item.id);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  // Get total price
  double getTotalPrice() {
    return _cart.fold(0.0, (sum, p) => sum + p.price * p.quantity);
  }

  // Get total item count
  int getTotalItemCount() {
    return _cart.fold(0, (sum, p) => sum + p.quantity);
  }

  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();
    receipt.writeln(DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()));
    receipt.writeln();
    receipt.writeln("───────────────────");

    for (final product in _cart) {
      receipt.writeln(
          "${product.quantity}x ${product.name} — ${_formatPrice(product.price)}");
    }

    receipt.writeln("───────────────────");
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  String _formatPrice(double price) => "\$${price.toStringAsFixed(2)}";
}