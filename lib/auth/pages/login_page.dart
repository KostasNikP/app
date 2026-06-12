import 'package:shop_app/auth/components/my_signIn.dart';
import 'package:shop_app/auth/components/my_textfield.dart';
import 'package:shop_app/auth/components/square_tile.dart';
import 'package:shop_app/auth/models/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class LoginPage extends StatelessWidget {
  final VoidCallback onTap; 

  LoginPage({super.key, required this.onTap});


  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in
  void singUserIn(){}



@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.surface,
    body: SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //logo
              Icon(
                Icons.shopping_cart_sharp,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 50),

              Text(
                "Welcome",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25),

              //username
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),



              const SizedBox(height: 20),

              //sign in button
             mysignIn(
  onTap: () {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {

    
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUsername(usernameController.text);
      userProvider.setEmail("example@example.com"); 

   
      Navigator.pushNamed(context, '/shop_page');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Αποτυχεία Σύνδεσης.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            content: Text(
              'Παρακαλώ συμπληρώστε τα στοιχεία σας.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  },
),

              const SizedBox(height: 20),

              //or Guest
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              //google + apple
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'photo/google.png'),

                  SizedBox(width: 25),

                  //apple button
                  SquareTile(imagePath: 'photo/apple.png'),
                ],
              ),

              const SizedBox(height: 50),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Navigate to registration page
                      Navigator.pushNamed(context, '/registration_page');
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
}
