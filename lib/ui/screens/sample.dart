import 'package:flutter/material.dart';
import 'package:motomechdashboard/app_state/appstate.dart';
import 'package:provider/provider.dart';

import '../../controller/data_controller.dart';
import 'drawer_screen.dart';

class Sheetal extends StatefulWidget {
  const Sheetal({Key? key}) : super(key: key);

  @override
  State<Sheetal> createState() => _SheetalState();
}

class _SheetalState extends State<Sheetal> {
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
              child: const AppDrawer(),
            ),

            Column(
              children:  <Widget>[
                TextField(
                    //onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                    ),
                    ),
                ),

                
              ],
            ),
          ]
      )
    );
  }
}




