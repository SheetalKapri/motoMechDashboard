import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../app_state/appstate.dart';

class GetDetails extends StatefulWidget {

  @override
  State<GetDetails> createState() => _GetDetailsState();
}

class _GetDetailsState extends State<GetDetails> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    CollectionReference users =
        FirebaseFirestore.instance.collection('mechanic');
    return FutureBuilder<DocumentSnapshot>(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Sr No'), tooltip: 'for numbering'),
                    DataColumn(label: Text('Name'), tooltip: 'for name of user'),
                    DataColumn(label: Text('Contact No'), tooltip: 'for number'),
                    DataColumn(label: Text('E-mail'), tooltip: 'for email'),
                    DataColumn(label: Text('Garage Address'),tooltip: 'for garage address'),
                    DataColumn(label: Text('Assistant'),tooltip: 'for no of assistant'),
                    DataColumn(label: Text('Status'),tooltip: 'for user verified or not'),
                  ],
                  rows: List<DataRow>.generate(appState.mechanicList.length,
                      (index) {
                    return DataRow(cells: [
                      DataCell(
                         Text(index.toString()),
                      ),
                      DataCell( Text(appState.mechanicList[index].mechanicId)),
                      DataCell( Text(appState.mechanicList[index].mechanicName)),
                      DataCell( Text(appState.mechanicList[index].mechPhone.toString())),
                      DataCell( Text(appState.mechanicList[index].mechAddress.area)),
                      DataCell( Text(appState.mechanicList[index].mechanicName)),
                      DataCell( Text(appState.mechanicList[index].mechanicName)),
                    ]);
                  })),
            ),
          );
        }
        return const Text('loading ..');
        // till the data is loaded displays loading
      }
      ),
    );
  }
}
