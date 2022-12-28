import 'package:flutter/material.dart';
import 'package:motomechdashboard/controller/data_controller.dart';
import '../posts/sample_uploads.dart';
import 'all_categories.dart';
//import 'dashboard.dart';
import 'all_mech_screen.dart';
import 'dashboardr2.dart';
//import 'main_dashboard.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
    final List<String> _titleList = [
    "Dashboard",
    "Mechanics",
    "Customers",
    "Jobs",
    "Verify Mechanic",
    "Verify Assistant",
    "Traffic",
    "Reviews",
    "Sample Uploads"
  ];

  final List<bool> _isSelectedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  final List<Icon> _leadingIcon = [
     const Icon(
      Icons.home,
      color: Colors.white,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
    ),
    const Icon(
      Icons.plumbing_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.verified_rounded,
      color: Colors.white,
    ),
    const Icon(
      Icons.verified_rounded,
      color: Colors.white,
    ),
    const Icon(
      Icons.monitor_heart_rounded,
      color: Colors.white,
    ),
    const Icon(
      Icons.rate_review,
      color: Colors.white,
    ),
    const Icon(
      Icons.add_business,
      color: Colors.white,
    ),
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 75, 70, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 100,left: 10),
        child: ListView.separated(
          itemCount: _titleList.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 5,    
            //color:  Color.fromARGB(255, 2, 88, 80),
            color:  Color.fromRGBO(5, 75, 70, 1),
            thickness: 0.1,
          ),
          itemBuilder: (BuildContext context, int index) => ListTile(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25))),
            tileColor: selectedIndex == index ? Colors.grey :  const Color.fromRGBO(5, 75, 70, 1),
            leading: _leadingIcon[index] ,  
            title: Text( _titleList[index],
              style:  TextStyle(
                color: selectedIndex == index ?Colors.black :Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            onTap: () {
              setState(() {
                selectedIndex = index;
                _isSelectedList[index] = !_isSelectedList[index];

                if (index == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const DashSecond()));
                } else if (index == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const AllMechanic()));
                } else if (index == 2) {

                }else if (index ==3){

                }else if (index ==4){
                  
                }else if (index ==5){
                  
                }else if (index ==6){
                  
                }else if (index ==7){
                  
                }else if (index ==8){
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  SampleUploads()));
                }

              });
            },
          ),
        ),
      ),
    );
  }
}