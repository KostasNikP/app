import 'package:shop_app/auth/login_or_regidter.dart';
import 'package:shop_app/auth/models/shop.dart';
import 'package:shop_app/auth/models/user_provider.dart';
import 'package:shop_app/auth/pages/Registration_Page.dart';
import 'package:shop_app/auth/pages/cart_page.dart';
import 'package:shop_app/auth/pages/login_page.dart';
import 'package:shop_app/auth/pages/profile_page.dart';
import 'package:shop_app/auth/pages/shop_page.dart';
import 'package:shop_app/auth/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegiState(),
      theme: Provider.of<ThemeProvider>(context).themeData, 
      routes: {
        '/login_page': (context) => LoginPage(onTap: () {}), 
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/registration_page': (context) => RegistrationPage(onTap: () {}),
        '/profile_page': (context) => const ProfilePage(),




      },
    );
  }
}
