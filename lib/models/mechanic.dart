import 'package:cloud_firestore/cloud_firestore.dart';

class Mechanic {
  late String mechanicId;
  late String mechanicName;
  late int mechPhone;
  late Timestamp mechDob;
  late MechAddress mechAddress;

  Mechanic(
      {required this.mechAddress,
      required this.mechDob,
      required this.mechPhone,
      required this.mechanicName,
      required this.mechanicId});
  factory Mechanic.fromSnapshot(DocumentSnapshot snapshot) {
    var mechAddress = snapshot.get('mechAddress') as Map<String, dynamic>;
    return Mechanic(
      mechAddress: MechAddress.fromJson(mechAddress),
      mechDob: snapshot.get('mechDob'),
      mechPhone: snapshot.get('mechPhone'),
      mechanicName: snapshot.get('mechName'),
      mechanicId: snapshot.id,
    );
  }
}

class MechAddress {
  String pincode;
  String area;
  MechAddress({
    required this.pincode,
    required this.area,
  });
  MechAddress.fromJson(Map<String, dynamic> jsonData)
      : pincode = jsonData['pincode'],
        area = jsonData['area'];
}
