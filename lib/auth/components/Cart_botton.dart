import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final Function()? onTap;

  const CartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25), // Αλλάξτε το περιθώριο εδώ
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(25), // Αλλάξτε την ακτίνα εδώ
        ),
        child: Center(
          child: Text(
            "Add to Cart",
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
