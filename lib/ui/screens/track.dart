import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TrackingDetails{
  late GeoPoint clientLatLng;
  late String garageName;
  late GeoPoint mechLocation;
  late String jobStatus;
  late String mechName;

  void trackingFun(String jobStatus, String mechName, String garageName,
      GeoPoint mechLocation, GeoPoint clientLatLng) {
    print("fub called");
    print(jobStatus);
    Container(
        color: Colors.amber.shade600,
        height: 500,
        width: 500,
        child: Column(
          children: const [
            Text("Sheetal"),
            //Text(jobStatus+ ' ' + ' ' +mechName + ' ' +garageName),
          ],
        ));
  }

 



}