import 'package:shop_app/auth/components/my_drawer.dart';
import 'package:shop_app/auth/components/my_filter.dart';
import 'package:shop_app/auth/components/search_bar.dart';
import 'package:shop_app/auth/models/shop.dart';
import 'package:shop_app/auth/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_product_tile.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Shop>(context).shop;

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild == null) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            const CustomSearchBar(),
            
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

          ],
          
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild == null) {
              currentFocus.unfocus();
            }
          },
          behavior: HitTestBehavior.opaque,
          child: Scrollbar(
            child: ListView(
              children: [
                // Trend Products
                const SizedBox(height: 25),
                const CustomfilterBar(),
                Center(
                  child: Text(
                    "Trend",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(product: product),
                            ),
                          );
                        },
                        child: MyProductTile(product: product),
                      );
                    },
                  ),
                ),
                // Discount Products
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "Discount",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final product = products[index + 4];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(product: product),
                            ),
                          );
                        },
                        child: MyProductTile(product: product),
                      );
                    },
                  ),
                ),
                // Other Products
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    "Other Products",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: products.length > 8 ? products.length - 8 : 0,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final product = products[index + 8];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(product: product),
                            ),
                          );
                        },
                        child: MyProductTile(product: product),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}