import 'package:cloud_firestore/cloud_firestore.dart';

class Mechanic {
  //late String mechanicId;
  //late Timestamp mechDob;
  late String mechanicName;
  late String mechPhone;
  late String mechEmail;
  late MechAddress mechAddress;

  Mechanic(
      {//required this.mechDob,
      //required this.mechanicId,
      required this.mechanicName,
      required this.mechPhone,
      required this.mechAddress, 
      required this.mechEmail,
      });

  factory Mechanic.fromSnapshot(DocumentSnapshot snapshot) {
    var mechAddress = snapshot.get('mechAddress') as Map<String, dynamic>;
    return Mechanic(
      mechAddress: MechAddress.fromJson(mechAddress),
      //mechDob: snapshot.get('mechDob'),
      //mechanicId: snapshot.id,
      mechPhone: snapshot.get('mechPhone'),
      mechanicName: snapshot.get('mechName'),
      mechEmail: snapshot.get('mechEmail'),
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





// ///////////////////
// ///fetchProductCategory AppState:
// js_primitives.dart:30 FIREBASE SERVICE FUNC fetchProductCategory
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 0
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 1
// js_primitives.dart:30 in firebase services
// js_primitives.dart:30 fetchProductCategory AppState:
// js_primitives.dart:30 FIREBASE SERVICE FUNC fetchProductCategory
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 0
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 1
// js_primitives.dart:30 in firebase services
// js_primitives.dart:30 fetchProductCategory AppState:
// js_primitives.dart:30 FIREBASE SERVICE FUNC fetchProductCategory
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 0
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 1
// js_primitives.dart:30 in firebase services
// js_primitives.dart:30 fetchProductCategory AppState:
// js_primitives.dart:30 FIREBASE SERVICE FUNC fetchProductCategory
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 0
// js_primitives.dart:30 ALLCATEGORIES
// js_primitives.dart:30 1