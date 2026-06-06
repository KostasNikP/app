import 'package:shop_app/auth/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Thanks you for the order!"),
          const SizedBox(
            height: 25
            ),
          Container(
            decoration: BoxDecoration(
              border: 
              Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(25),
            child: Consumer<Shop>(
              builder: (context, shop, child) => 
              Text(shop.displayCartReceipt()) ,)
          ),
        ],),
    ),
    );
  }
}