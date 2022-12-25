import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/screens/dashboard.dart';

import 'drawer_screen.dart';

class DashSecond extends StatefulWidget {
  const DashSecond({super.key});

  @override
  State<DashSecond> createState() => _DashSecondState();
}

class _DashSecondState extends State<DashSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 6,
            height: 900,
            color: const Color.fromARGB(255, 2, 88, 80),
            child: const SafeArea(
              child: AppDrawer(),
            ),
          ),

          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 37, 37, 35),
              child: const Dashboard(),
            ),
          ),
        ],
      ),

    );
  }
}