import 'package:flutter/material.dart';
import 'package:motomechdashboard/controller/data_controller.dart';
import '../posts/sample_uploads.dart';
import 'all_categories.dart';
//import 'dashboard.dart';
import 'dashboardr2.dart';
//import 'main_dashboard.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool click = true;
  @override
  Widget build(BuildContext context) {
    //return buttonSection;

    return SafeArea(
      child: Container(
        width: 220,
        color: const Color.fromARGB(146, 3, 100, 79),
        child: Padding(
          padding: const EdgeInsets.only(top: 100,left: 10),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home,color: Colors.white,),
                title: const Text('Dashboard'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(213, 22, 1, 1),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const DashSecond()));},
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text('Mechanics'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetDetails()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text('Customer'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.plumbing_outlined,
                  color: Colors.white,
                ),
                title: const Text('Jobs'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                ),
                title: const Text('Verify Mechanic'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.verified_rounded,
                  color: Colors.white,
                ),
                title: const Text('Verify Assistant'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.monitor_heart_rounded,
                  color: Colors.white,
                ),
                title: const Text('Traffic'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.rate_review),
                iconColor: Colors.white,
                title: const Text('Reviews'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.add_business,
                  color: Colors.white,
                ),
                title: const Text('Sample uploads'),
                textColor: Colors.white,
                selectedTileColor: const Color.fromARGB(214, 85, 83, 83),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  SampleUploads())
                      // to transit to next page >PostScreen
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
