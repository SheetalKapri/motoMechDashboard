import 'package:flutter/material.dart';
import 'package:motomechdashboard/app_state/appstate.dart';
import 'package:motomechdashboard/utils/constants.dart';
import 'package:provider/provider.dart';

import '../posts/side_bar.dart';
import 'drawer_screen.dart';

class AllMechanic extends StatefulWidget {
  const AllMechanic({Key? key}) : super(key: key);

  @override
  State<AllMechanic> createState() => _AllMechanicState();
}

class _AllMechanicState extends State<AllMechanic> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children:[
          const Expanded(
            child: AppDrawer(),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: primaryColor,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),color: secondaryColor),
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width / 1,
                      height: 40,
                        child: const Header(),
                    ),
                    

                    const SizedBox(height: 15,),
                    SearchBar(searchController: _searchController, searchText: 'Search Mechanics'),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: MechanicTable(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MechanicTable extends StatelessWidget {
  const MechanicTable({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white),
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
        child: DataTable(
          columns: [
        const DataColumn(label: Text('Sr No',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'serial no'),
        const DataColumn(label: Text('Name',style: TextStyle(fontWeight: FontWeight.bold)), tooltip: 'name of user'),
        const DataColumn(label: Text('Contact No',style: TextStyle(fontWeight: FontWeight.bold)), tooltip: 'Phone number'),
        const DataColumn(label: Text('E-mail',style: TextStyle(fontWeight: FontWeight.bold)), tooltip: 'email'),
        const DataColumn(label: Text('Garage Address',style: TextStyle(fontWeight: FontWeight.bold)), tooltip: 'garage address'),
        const DataColumn(label: Text('Assistant',style: TextStyle(fontWeight: FontWeight.bold)), tooltip: 'no of assistant'),
        const DataColumn(label: Text('Status',style: TextStyle(fontWeight: FontWeight.bold)), tooltip: 'mech verified or not'),
        DataColumn(label: Row(
          children: [
            IconButton(color: primaryColor,icon: const Icon(Icons.arrow_upward,color: Colors.white,),onPressed: () {
                
              },
              ),
              const SizedBox(width: 10,),
              IconButton(color: primaryColor,icon: const Icon(Icons.arrow_downward,color: Colors.white,),onPressed: () {
                  
                },
                ),
              
          ],
        ), tooltip: 'arrange'),
          ],
          rows: List<DataRow>.generate(appState.mechanicList.length, (index) {
        return DataRow(cells: [
          DataCell(Text(index.toString()),),
          DataCell(Text(appState.mechanicList[index].mechanicName)),
          DataCell(Text(appState.mechanicList[index].mechPhone)),
          DataCell(Text(appState.mechanicList[index].mechEmail)),
          DataCell(Text(appState.mechanicList[index].mechAddress.area)),
          DataCell(Text(appState.mechanicList[index].mechanicName)),
          DataCell(Text(appState.mechanicList[index].mechanicName)),
          DataCell(Row(
            children: [
              Container(
                color: primaryColor,
                child: IconButton(color: primaryColor,icon: const Icon(Icons.edit,color: Colors.white,),onPressed: () {
                  
                },
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                color: primaryColor,
                child: IconButton(color: primaryColor,icon: const Icon(Icons.lock,color: Colors.white,),onPressed: () {
                  
                },
                ),
              ),
            ],
          )),
        ]);
          })),
          ),
        ),
      ),
    );
  }
}
