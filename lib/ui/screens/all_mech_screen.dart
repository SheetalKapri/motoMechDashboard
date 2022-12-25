//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motomechdashboard/app_state/appstate.dart';
import 'package:motomechdashboard/models/mechanic.dart';
import 'package:provider/provider.dart';

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
    return SafeArea(
      child: Scaffold(
        // drawer: AppDrawer(),
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text('All Mechanic List'),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => const SampleUploads())
        //               // to transit to next page >PostScreen
        //               );
        //         },
        //         icon: const Icon(Icons.add))
        //   ],
        // ),

        //backgroundColor: Colors.white70,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TextField(
              //   //onChanged: (value) => _runFilter(value),
              //   decoration: InputDecoration(
              //     contentPadding:
              //         const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              //     hintText: "Search",
              //     suffixIcon: const Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20.0),
              //       borderSide: const BorderSide(),
              //     ),
              //   ),
              // ),

              Container(
                width: MediaQuery.of(context).size.width / 6,
                height: 900,
                color: const Color.fromARGB(255, 2, 88, 80),
                child: const SafeArea(
                  child: AppDrawer(),
                ),
              ),

              Expanded(
                  child:  Column(
                              children: List<Widget>.generate(
                                  appState.mechanicList.length, (index) {
                                return MechanicWidget(
                                  mechanic: appState.mechanicList[index],
                                );
                              }),
                            )
                      )
                      
            ],
          ),
        ),
      ),
    );
  }
}

class MechanicWidget extends StatelessWidget {
  final Mechanic mechanic;
  const MechanicWidget({Key? key,  required this.mechanic})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(mechanic.mechanicName),
        const SizedBox(
          width: 10,
        ),
        Text(mechanic.mechPhone.toString()),
        const SizedBox(
          width: 10,
        ),
        Text(mechanic.mechAddress.pincode)
      ]),
    );
  }
}
