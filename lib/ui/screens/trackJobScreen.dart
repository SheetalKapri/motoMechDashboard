import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motomechdashboard/utils/constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../posts/side_bar.dart';
import 'drawer_screen.dart';

class TrackJobScreen extends StatefulWidget {
  const TrackJobScreen({super.key});

  @override
  State<TrackJobScreen> createState() => _TrackJobScreenState();

  void getClientPoint(GeoPoint clientLatLng) {}
}

class _TrackJobScreenState extends State<TrackJobScreen>
    with TickerProviderStateMixin {
  late GoogleMapController mapController;
  String jobStatus = "Ongoing";
  //late GeoPoint clientPoint;
  List<Marker> _markers = [];
  // getClientPoint(GeoPoint clientloc) {
  //   clientPoint = clientloc;
  // }

  //list of steps for stepper
  // TIMELINE
  // final List<step.Step> _steps = [
  //   const step.Step(
  //     shimmer: true,
  //     title: "Testing",
  //     iconStyle: primaryColor,
  //     content: Align(
  //       alignment: Alignment.centerLeft,
  //       child: Text("subtitle"),
  //       ),
  //   ),
  //   const step.Step(
  //     shimmer: true,
  //     title: "Testing",
  //     iconStyle: primaryColor,
  //     content: Align(
  //       alignment: Alignment.centerLeft,
  //       child: Text("subtitle"),
  //       ),
  //   ),
  //   const step.Step(
  //     shimmer: true,
  //     title: "Testing456",
  //     iconStyle: primaryColor,
  //     content: Align(
  //       alignment: Alignment.centerLeft,
  //       child: Text("subtitle"),
  //       ),
  //   ),
  //   const step.Step(
  //     shimmer: true,
  //     title: "Testing",
  //     iconStyle: primaryColor,
  //     content: Align(
  //       alignment: Alignment.centerLeft,
  //       child: Text("subtitle"),
  //       ),
  //   ),
  //   const step.Step(
  //     shimmer: true,
  //     title: "Testing123",
  //     iconStyle: primaryColor,
  //     content: Align(
  //       alignment: Alignment.centerLeft,
  //       child: Text("subtitle"),
  //       ),
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('Client location'),
        infoWindow: InfoWindow(title: 'CLients location'),
        //position: LatLng(clientPoint.latitude, clientPoint.longitude)));
        position: LatLng(15.2673, 73.9709)));
  }

  @override
  Widget build(BuildContext context) {
    //final appState = Provider.of<Appstate>(context);
    //clientPoint = appState.appointmentsList[0].clientLatLng;

    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: Row(children: [
        const Expanded(
          //flex: 1,
          child: AppDrawer(),
        ),
        //const SideBarItems(), // to include the top bar items
        Expanded(
          flex: 5,
          child: Container(
            color: primaryColor,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: Color.fromARGB(255, 218, 213, 213)),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 40,
                    child: const Header(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SearchBar(
                      searchController: _searchController,
                      searchText: 'Search Jobs'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Date:05/12/2022',
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        'Time: 01:45 pm',
                      ),
                      SizedBox(
                        width: 60,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 60),
                    height: 440,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: GoogleMap(
                            padding: const EdgeInsets.only(left: 30),
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(15.2673, 73.9709), zoom: 10.0),
                            //target: LatLng(clientPoint.latitude,clientPoint.longitude),zoom: 10.0),
                            onMapCreated: (controller) {
                              setState(() {
                                mapController = controller;
                              });
                            },
                            markers: Set<Marker>.of(_markers),
                            mapType: MapType.normal,
                          ),
                        ),
                        // //const SizedBox(width: 10,),

                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          width: 300,
                          height: 440,
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                TimelineJobs(
                                    jobName: 'Received Job',
                                    firstEle: true,
                                    lastEle: false),
                                TimelineJobs(
                                    jobName: "Mechanic Notified",
                                    firstEle: false,
                                    lastEle: false),
                                TimelineJobs(
                                    jobName: "Job Accepted",
                                    firstEle: false,
                                    lastEle: false),
                                TimelineJobs(
                                    jobName: "Mechanic Arrived",
                                    firstEle: false,
                                    lastEle: false),
                                TimelineJobs(
                                    jobName: "Job Completed",
                                    firstEle: false,
                                    lastEle: true),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: 400,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Job Status :" + jobStatus),
                              const SizedBox(
                                height: 18,
                              ),
                              Text("Attended By :" + jobStatus),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Garage Name :$jobStatus"),
                              const SizedBox(
                                height: 18,
                              ),
                              const Text("Garage Name : ABC Automobile"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        //const SizedBox(height: 15,),
      ]),
    );

    //   Expanded(
    //     child: Padding(
    //           padding: const EdgeInsets.all(100),
    //           //padding: const EdgeInsets.only(left: 15),
    //           child: GoogleMap(
    //             initialCameraPosition: const CameraPosition(
    //                 target: LatLng(15.2673, 73.9709), zoom: 10.0),
    //             //target: LatLng(clientPoint.latitude,clientPoint.longitude),zoom: 10.0),
    //             onMapCreated: (controller) {
    //               setState(() {
    //                 mapController = controller;
    //               });
    //             },
    //             markers: Set<Marker>.of(_markers),
    //             mapType: MapType.normal,
    //           ),
    //         ),
    //   ),
  }
}

class TimelineJobs extends StatelessWidget {
  const TimelineJobs({
    Key? key,
    required this.jobName,
    required this.firstEle,
    required this.lastEle,
  }) : super(key: key);

  final String jobName;
  final bool firstEle, lastEle;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: const IndicatorStyle(
        color: Color.fromARGB(174, 23, 160, 27),
        height: 10,
        width: 10,
      ),
      isFirst: firstEle,
      isLast: lastEle,
      afterLineStyle: const LineStyle(color: Colors.black, thickness: 2),
      beforeLineStyle: const LineStyle(color: Colors.black, thickness: 2),
      alignment: TimelineAlign.center,
      endChild: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(jobName),
      ),
    );
  }
}

/// 15.2673, 73.9709
