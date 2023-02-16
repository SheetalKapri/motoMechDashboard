import 'package:flutter/material.dart';

import 'drawer_screen.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final postController = TextEditingController();
  final Color iconColor = const Color.fromRGBO(5, 75, 70, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(50.0),
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          MyMenu(title: "Mechanics", icon: Icons.account_balance, warna: iconColor,collName: 'mechanic'),
          MyMenu(title: "Customers", icon: Icons.account_balance, warna: iconColor,collName: 'customer'),
          MyMenu(title: "Verified Mechanics", icon: Icons.account_balance, warna: iconColor,collName: 'users'),
          MyMenu(title: "Verified Assistant", icon: Icons.account_balance, warna: iconColor,collName: 'mechanic'),
          MyMenu(title: "Pending Verification", icon: Icons.account_balance, warna: iconColor,collName: 'testing'),

        ],
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({super.key, required this.title, required this.icon, required this.warna,required this.collName});

  final String title;
  final IconData icon;
  final Color warna;
  final String collName;
  int count=0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){ },
        splashColor: Colors.teal.shade800,
        child: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 60.0,color: warna,),
              const SizedBox(height: 10,),
              Text(title, style: const TextStyle(fontSize: 14.0),),
              Text('Count : $count', style: const TextStyle(fontSize: 14.0),),
            ],
          ),
        ),
      ),
    );
  }
}
