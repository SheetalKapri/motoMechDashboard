
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motomechdashboard/utils/constants.dart';


class Secondary extends StatefulWidget {
  const Secondary({super.key});

  @override
  State<Secondary> createState() => _SecondaryState();
}

class _SecondaryState extends State<Secondary> {
   late GoogleMapController mapController;

  static const LatLng sourceLocation = LatLng(15.2673, 73.9709);
  static const LatLng destLocation = LatLng(35.2673, 77.9709);
  List<LatLng> polylineCords = [];

  //late GeoPoint clientPoint;
  List<Marker> _markers = [];
  // getClientPoint(GeoPoint clientloc) {
  //   clientPoint = clientloc;
  // }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destLocation.latitude, destLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCords.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() { });
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      //padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 500,
                        width: 500,
                        child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                          target: sourceLocation, zoom: 10.0),
                    polylines: {
                        Polyline(polylineId: PolylineId("route"),
                        points: polylineCords,
                        color: primaryColor,
                        width: 6,
                        )
                    },
                    // onMapCreated: (controller) {
                    //   setState(() {
                    //     mapController = controller;
                    //   });
                    // },
                    markers: {
                        const Marker(
                          markerId: MarkerId("source"),
                          position: sourceLocation,
                        ),
                        const Marker(
                          markerId: MarkerId("destination"),
                          position: destLocation,
                        ),
                    },
                    mapType: MapType.normal,
                  ),
                      ),),
                  )
      ],
                   
    );
  }
}