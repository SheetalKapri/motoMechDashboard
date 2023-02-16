import 'package:flutter/material.dart';
import 'package:motomechdashboard/app_state/appstate.dart';
import 'package:motomechdashboard/models/mechanic.dart';
import 'package:provider/provider.dart';

import 'drawer_screen.dart';

class AllCustomer extends StatefulWidget {
  const AllCustomer({Key? key}) : super(key: key);

  @override
  State<AllCustomer> createState() => _AllCustomerState();
}

class _AllCustomerState extends State<AllCustomer> {
  //final FirebaseFirestore _db = FirebaseFirestore.instance;
  // List<String> searchCust = [];
  // late Customer cust;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
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
              child: Column(
           
          ))
        ],
      ),
    );
  }
}
