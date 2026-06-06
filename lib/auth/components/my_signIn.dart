// ignore_for_file: file_names

import 'package:flutter/material.dart';

class mysignIn extends StatelessWidget {
  final Function()? onTap;

  const mysignIn({super.key, required this.onTap});
  

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(125),
          
          ),
          child:  Center(
            child: Text(
              
              "Sign In",
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