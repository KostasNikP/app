import 'package:shop_app/auth/components/my_product_tile.dart';
import 'package:shop_app/auth/models/product.dart';
import 'package:shop_app/auth/models/shop.dart';
import 'package:shop_app/auth/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopFilterPage extends StatelessWidget {
  final bool isChecked1;
  final bool isChecked2;
  final bool isChecked3;
  final bool isChecked4;

  const ShopFilterPage({super.key, 
    required this.isChecked1,
    required this.isChecked2,
    required this.isChecked3,
    required this.isChecked4,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final filteredProducts = _getFilteredProducts(context);

        return Scaffold(
          body: Stack(
            children: [
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

                    // Τίτλος
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 5),
                      child: Text(
                        'Filtered Products',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),

                    // Προϊόντα
                    Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(15),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: filteredProducts.map((product) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductPage(product: product),
                                    ),
                                  );
                                },
                                child: MyProductTile(product: product),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Product> _getFilteredProducts(BuildContext context) {
    final allProducts = Provider.of<Shop>(context, listen: false).shop;

    return allProducts.where((product) {
      if ((isChecked1 && product.id == 1) ||
          (isChecked2 && product.id == 2) ||
          (isChecked3 && product.id == 3) ||
          (isChecked4 && product.id == 4)) {
        return true;
      } else {
        return false;
      }
    }).toList();
  }
}