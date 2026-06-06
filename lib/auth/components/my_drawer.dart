import 'package:shop_app/auth/components/my_list_tile.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            //drawer heard: logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
               size:72,
               color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),


          const SizedBox(height: 25),

          //shop title
          MyListTile(
            text: "Shop", 
            icon: Icons.home,
            textColor: Theme.of(context).colorScheme.inversePrimary,
            onTap: () =>Navigator.pop(context)
            ),


          // cart title
          MyListTile(
            text: "Cart", 
            icon: Icons.shopping_cart, 
            textColor: Theme.of(context).colorScheme.inversePrimary,
            onTap: (){
              
              //pop drawer firts
              Navigator.pop(context);


             // go to cart page
             Navigator.pushNamed(context, '/cart_page');
            },
            ),

            //profile
          MyListTile(
            text: "Profile", 
            textColor: Theme.of(context).colorScheme.inversePrimary,
            icon: Icons.person, 
            onTap: () {
              
              //pop drawer firts
              Navigator.pop(context);


             // go to cart page
             Navigator.pushNamed(context, '/profile_page');
            },
            ),



          ],
        ),
          

          //exit shop title
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit", 
              textColor: Theme.of(context).colorScheme.inversePrimary,
              icon: Icons.logout, 
              onTap: () =>Navigator.pushNamedAndRemoveUntil(
                context, '/login_page', (route) => false)
              ),
          ),


        ],
      ),
    );
  }
}