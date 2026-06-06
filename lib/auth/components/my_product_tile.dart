import 'package:shop_app/auth/models/product.dart';
import 'package:shop_app/auth/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatefulWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product,
  });

  @override
  _MyProductTileState createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Add this item to your cart?",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "cancel",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(widget.product.id, widget.product);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      width: 200,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(widget.product.imagePath),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(_animationController),
                child: Text(
                  widget.product.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                  ),
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 25,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 255, 7),
                  size: 16,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${widget.product.price.toStringAsFixed(2)}'),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}