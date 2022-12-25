import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motomechdashboard/ui/auth/splash_screen.dart';
import 'package:provider/provider.dart';

import 'app_state/appstate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb)
  {
      await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: "AIzaSyD01dMSEZ9F7KMN4APVBx5O1JvfqASmkGo",
      appId: "1:651713903279:android:b3a6fb08d384d76fcdf25a",
      messagingSenderId: "651713903279",
      projectId: "motomech-2e181",
      ),
    );

  }

else
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Appstate(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 2, 88, 80)),
          primarySwatch: Colors.indigo,
          ),
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("Error");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return const SplashScreen();
                //return MainDashboard();
              }
              return const CircularProgressIndicator();
            }),
    )
          ,
    );
  }
}

