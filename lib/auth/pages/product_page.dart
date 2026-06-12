import 'package:shop_app/auth/components/Cart_botton.dart';
import 'package:shop_app/auth/models/product.dart';
import 'package:shop_app/auth/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});
 
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void addToCart(Product product) {
    final shop = context.read<Shop>();

    for (int i = 0; i < _quantity; i++) {
      shop.addToCart(product.id, product);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          '${product.name} added to cart',
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                      bottom: false,
                      child: Container(
                        margin: const EdgeInsets.only(left: 25, top: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

               
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.product.imagePath,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Όνομα
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 5),

                        // Τιμή
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Περιγραφή
                        Text(
                          widget.product.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Quantity selector
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: _decrementQuantity,
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                _quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: _incrementQuantity,
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),

                   
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
              ],
            ),
          ),

        
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: CartButton(
                onTap: () => addToCart(widget.product),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
