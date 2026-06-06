import 'package:shop_app/auth/pages/registration_page.dart';
import 'package:shop_app/auth/pages/login_page.dart';
import 'package:flutter/material.dart';


class LoginOrRegiState extends StatefulWidget {
  const LoginOrRegiState({super.key});

  @override
  State<LoginOrRegiState> createState() => __LoginOrRegiStateState();
}


class __LoginOrRegiStateState extends State<LoginOrRegiState> {


  //initially show login page

  bool showLoginPage =true;


  //toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    if  (showLoginPage){
      return LoginPage(onTap: togglePages);
    }else{
      return RegistrationPage(onTap: togglePages);
    }
  }
}