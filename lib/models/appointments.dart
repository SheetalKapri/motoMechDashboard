import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments {
  late ClientDetails clientDetails;
  //late ClientDetails clientId;
  late MechDetails mechDetails;
  late String jobDescription;
  late Timestamp appointmentDate;
  late String jobStatus;
  late GeoPoint clientLatLng;

  Appointments({
    required this.clientDetails,
    required this.mechDetails,
    required this.jobDescription,
    required this.appointmentDate,
    required this.jobStatus,
    required this.clientLatLng,
  });

  factory Appointments.fromSnapshot(DocumentSnapshot snapshot) {
    var clientJsonDetail =
        snapshot.get('clientDetails') as Map<String, dynamic>;
    var mechJsonDetail = snapshot.get('assistentMech') as Map<String, dynamic>;
    MechDetails mechInfo = MechDetails.fromJson(mechJsonDetail);
    ClientDetails clientInfo = ClientDetails.fromJson(clientJsonDetail);

    return Appointments(
      //mechAddress: MechAddress.fromJson(mechAddress),
      clientDetails: clientInfo,
      mechDetails: mechInfo,
      //clientId: snapshot.id,
      appointmentDate: snapshot.get('appointmentDate'),
      jobDescription: snapshot.get('jobDescription'),
      jobStatus: snapshot.get('jobStatus'),
      clientLatLng: snapshot.get('pickupLocation'),
    );
  }
}

class ClientDetails {
  late String clientName;
  ClientDetails({
    required this.clientName,
  });
  ClientDetails.fromJson(Map<String, dynamic> jsonData)
      : //clientId = jsonData['clientId'],
        clientName = jsonData['name'];
}

class MechDetails {
  late String mechName;
  late GeoPoint mechLocation;
  late String garageName;
  MechDetails({
    required this.mechName,
  });
  MechDetails.fromJson(Map<String, dynamic> jsonData)
      : mechName = jsonData['assistentName'],
      mechLocation = jsonData['assistentLocation'],
      garageName = jsonData['shopName'];
}
