import 'package:shop_app/auth/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/auth/models/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
final userProvider = Provider.of<UserProvider>(context);
final username = userProvider.username;
final email = userProvider.email;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Προφίλ'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Χρήστης: $username',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
