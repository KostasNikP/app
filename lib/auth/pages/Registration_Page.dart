import 'package:shop_app/auth/components/my_signUp.dart';
import 'package:shop_app/auth/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  final VoidCallback onTap; // Προσθήκη της παραμέτρου onTap

  const RegistrationPage({super.key, required this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {



  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //sign user in
  void signUserIn(){}



@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
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
                "Let's create an account for you",
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
              //email
              MyTextField(
                controller: emailController,
                hintText: 'email',
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

              //confirmpassword
              MyTextField(
                controller: confirmpasswordController,
                hintText: 'confirmpassword',
                obscureText: true,
              ),

              const SizedBox(height: 10),



              const SizedBox(height: 20),

              //sign in button
              mysignUp(
                onTap: () {
                  // Check if name and password are not empty
                  if (usernameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty&&
                      passwordController.text.isNotEmpty) {
                    // Navigate to next page
                    Navigator.pushNamed(context, '/shop_page');
                  } else {
                    // Show a dialog to inform the user to fill in both fields
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Αποτυχία Σύνδεσης. ',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          content: Text(
                            'Παρακαλώ συμπληρώστε τα στοιχεία σας. ',
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

              //already have
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
                        'Already Sign in',
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


              const SizedBox(height: 50),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Navigate to registration page
                      Navigator.pushNamed(context, '/login_page');
                    },
                    child: const Text(
                      'Sign in',
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