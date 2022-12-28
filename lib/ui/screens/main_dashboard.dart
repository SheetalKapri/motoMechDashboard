
import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/screens/dashboard.dart';

import 'drawer_screen.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
            height: 900,
            //color: const Color.fromARGB(255, 2, 88, 80),
            child: const AppDrawer(),
          ),

          Expanded(
            child: Container(
              color: const Color.fromRGBO(5, 75, 70, 1),
              child: const Dashboard(),
            ),
          ),
        ],
      ),

    );
  }
}
