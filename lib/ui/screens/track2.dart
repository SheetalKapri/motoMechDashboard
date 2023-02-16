import 'package:flutter/material.dart';
import 'package:motomechdashboard/ui/screens/track.dart';

class Hojaa extends StatefulWidget {
  const Hojaa({super.key});

  @override
  State<Hojaa> createState() => _HojaaState();
}

class _HojaaState extends State<Hojaa> {
  final TrackingDetails tracking = TrackingDetails();
  late String jobStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[400],
        height: 500,
        width: 500,
        child: Column(
          children:  [
            const Text('Sheetal'),
            const SizedBox( height: 10,),
            //Text(late tracking.jobStatus),


            // tracking.trackingFun(appState.appointmentsList[index].jobStatus,
            //                   appState
            //                       .appointmentsList[index].mechDetails.mechName,
            //                   appState
            //                       .appointmentsList[index].mechDetails.garageName,
            //                   appState.appointmentsList[index].mechDetails.mechLocation,
            //                   appState.appointmentsList[index].clientLatLng),
          ],
        ));
  }
}
