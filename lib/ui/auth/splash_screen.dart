import 'package:flutter/material.dart';
import '../../firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen= SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MOTO MECH APP',
          style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.bold,decorationStyle: TextDecorationStyle.double,
              decorationThickness: 2.0,letterSpacing: 3,fontSize: 30,),
        )
      )
    );
  }
}
