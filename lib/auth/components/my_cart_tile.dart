import 'package:shop_app/auth/components/my_quantity_selector.dart';
import 'package:shop_app/auth/models/product.dart';
import 'package:shop_app/auth/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final Product product;

  const MyCartTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.imagePath,
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(width: 10),
              // Name, price, and total price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    // Product price
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    
                    // Total price for the product
                    Text(
                      'Total: \$${(product.price * product.quantity).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                             color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
              // Quantity selector
              QuantitySelector(
                quantity: product.quantity,
                onDecrement: () {
                  Provider.of<Shop>(context, listen: false).removeFromCart(product);
                },
                onIncrement: () {
Provider.of<Shop>(context, listen: false).addToCart(product.id, product);


},

              ),
              // Remove button
              IconButton(
                onPressed: () {
                  Provider.of<Shop>(context, listen: false).removeFromCart(product);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
