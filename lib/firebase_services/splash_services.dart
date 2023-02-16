import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/auth/login_screen.dart';
import 'package:motomechdashboard/ui/auth/signup_screen.dart';


class SplashServices {
  void isLogin(BuildContext context) {
    // part-9 check if user is already login/log out
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    // to check if this user has already loged in or not
    if (user != null) {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()))
            //context, MaterialPageRoute(builder: (context) =>  const AllMechanic()))
          // if not already loged in then transit to login screen page
          );
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignupScreen()))
           //context, MaterialPageRoute(builder: (context) =>   const AllMechanic()))
          // else send to signupScreen
          );
    }
  }
}
