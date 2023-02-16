import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motomechdashboard/app_state/appstate.dart';
import 'package:motomechdashboard/ui/screens/track2.dart';
import 'package:motomechdashboard/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../widgets/roundButton.dart';
import '../posts/side_bar.dart';
import 'drawer_screen.dart';

class AllJobs extends StatefulWidget {
  const AllJobs({Key? key}) : super(key: key);

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  bool loading = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          const Expanded(
            child: AppDrawer(),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: primaryColor,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    color: secondaryColor),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: JobsTable(),
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

class JobsTable extends StatelessWidget {
  JobsTable({
    Key? key,
  }) : super(key: key);

  late GoogleMapController _mapController;
  Map<String, Marker> _markers = {};
  

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    late GeoPoint clientPoint;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      child: Expanded(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('Customer Name'),
                ),
                DataColumn(
                  label: Text('Assigned Mechanic'),
                ),
                DataColumn(
                    label: Text('Requested'), tooltip: 'job description'
                ),
                DataColumn(label: Text('Date'), tooltip: 'date of job'
                ),
                DataColumn(
                    label: Text('Status'),
                    tooltip: 'pending/complete/assigned'),
                DataColumn(
                  label: Icon(Icons.arrow_downward),
                ),
              ],
              rows: List<DataRow>.generate(appState.appointmentsList.length,
                  (index) {
                return DataRow(cells: [
                  DataCell(Text(appState
                      .appointmentsList[index].clientDetails.clientName)),
                  DataCell(Text(
                      appState.appointmentsList[index].mechDetails.mechName)),
                  DataCell(
                      Text(appState.appointmentsList[index].jobDescription)),
                  DataCell(Text(appState.appointmentsList[index].appointmentDate
                      .toDate()
                      .toString())),
                  DataCell(Text(appState.appointmentsList[index].jobStatus)),
                  //DataCell(Text(appState.appointmentsList[index].clientLatLng.toString())),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        width: 100,
                        height: 40,
                        child: RoundButton(
                          title: 'Track Job',
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => const Hojaa()));
                          }
                          // {
                          //   trackingFun(
                                // appState.appointmentsList[index].jobStatus,
                                // appState
                                //     .appointmentsList[index].mechDetails.mechName,
                                // appState
                                //     .appointmentsList[index].mechDetails.garageName,
                                // appState.appointmentsList[index].mechDetails.mechLocation,
                                // appState.appointmentsList[index].clientLatLng);

                          //   // Navigator.push(
                          //   //     context,
                          //   //     MaterialPageRoute(
                          //   //         builder: (context) => const Tracking()));
                          //   //jobMapPage.getClientPoint(appState.appointmentsList[index].clientLatLng);
                          //   //const JobMapPage();
                          //   // mapDisplay(appState.appointmentsList[index].clientLatLng);
                          //   // print("clickeddd");

                          //   //   Navigator.of(context).pushNamed( 'job_map_page',arguments: {
                          //   //       'currentGeoLoc': appState.appointmentsList[index].clientLatLng,
                          //   //     },
                          //   //   );
                          // },

                        ),
                      ),
                    ),
                  ),
                ]);
              })),
        ),
      )),
    );
  }



  void mapDisplay(GeoPoint clientPoint) {
    try {
      print("called mapDisplay");
      Expanded(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(clientPoint.latitude, clientPoint.longitude),
              zoom: 10.0),
          onMapCreated: (controller) {
            _mapController = controller;
            addMarker('test', clientPoint);
          },
          markers: _markers.values.toSet(),
        ),
      );
      print("called mapdisplay");
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }

  addMarker(String uniqueId, GeoPoint clientPoint) {
    var marker = Marker(
      markerId: MarkerId(uniqueId),
      position: LatLng(clientPoint.latitude, clientPoint.longitude),
      infoWindow: const InfoWindow(title: 'Client Location'),
    );
    _markers[uniqueId] = marker;
  }
}
