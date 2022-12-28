import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/screens/dashboard.dart';
//import 'package:motomechdashboard/ui/screens/sample.dart';

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
          SizedBox(
            width: MediaQuery.of(context).size.width / 6,
            height: 900,
            child: const AppDrawer(),
          ),

          const Expanded(
            child: Dashboard(),
          ),
        ],
      ),

    );
  }
}