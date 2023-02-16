import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motomechdashboard/ui/screens/all_jobs_screen.dart';
import 'package:motomechdashboard/utils/constants.dart';


class JobMapPage extends StatefulWidget {
  const JobMapPage({super.key});

  @override
  State<JobMapPage> createState() => _JobMapPageState();

  void getClientPoint(GeoPoint clientLatLng) {}
}

class _JobMapPageState extends State<JobMapPage> {
  late GoogleMapController mapController;
  //late GeoPoint clientPoint;
  List<Marker> _markers = [];
  // getClientPoint(GeoPoint clientloc) {
  //   clientPoint = clientloc;
  // }

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
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const AllJobs()));
        },icon: const Icon(Icons.arrow_back_ios), 
        ),
      ),
      body: Row(
         children:[
          Expanded(
            flex: 5,
            child: Container(
              color: primaryColor,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),color: Color.fromARGB(255, 218, 213, 213)),
                child: Column(
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Date:05/12/2022',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Time: 01:45 pm',
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Expanded(
                      child: GoogleMap(
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
              ],
                ),
              ),
            ),
          ),
        ],
     
            
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
             
              // ], 
            ),
    );

  }
}
