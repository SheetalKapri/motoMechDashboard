//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motomechdashboard/app_state/appstate.dart';
import 'package:provider/provider.dart';

import '../../controller/data_controller.dart';
import 'drawer_screen.dart';

class AllMechanic extends StatefulWidget {
  const AllMechanic({Key? key}) : super(key: key);

  @override
  State<AllMechanic> createState() => _AllMechanicState();
}

class _AllMechanicState extends State<AllMechanic> {
  //final FirebaseFirestore _db = FirebaseFirestore.instance;

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
                  children: 
                  List<Widget>.generate(
                    appState.mechanicList.length, (index) {
                      return GetDetails( );
                    }),
                )
            )
          ],
      ),
    );
  }
}
