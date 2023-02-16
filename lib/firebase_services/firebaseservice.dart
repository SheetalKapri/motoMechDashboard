import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motomechdashboard/models/appointments.dart';
import '../models/mechanic.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///ADD SERVICE
  Future<List<Mechanic>?> fetchMechanics() async {
    //print("FIREBASE SERVICE FUNC fetchProductCategory");
    var response = await _db.collection("mechanic").get();
    try {
      //print("in firebase services");
      //print(response.docs.first.data());
      //print(response.docs.last.data());
      return response.docs.map((e) => Mechanic.fromSnapshot(e)).toList();
    } catch (error) {
      print("something wrong $error");
      return null;
    }
  }

  Future<List<Appointments>?> fetchAppointments() async{
    //print("FIREBASE SERVICE fetchAppointments");
    var responseAppt = await _db.collection("appointments").get();
    try {
      //print("in firebase services 2");
      //print(responseAppt.docs.first.data());
      //List<Appointments> items = [];
      // var a;
      // for (var i = 0; i < 2; i++) {
      //   a = responseAppt.docs[i];
      //   print("aaaa================================================================");
      //   print(a.data());
      // }
      return responseAppt.docs.map((e) => Appointments.fromSnapshot(e)).toList();
    } catch (error) {
      print("something wrong $error");
      return null;
    }
  } 
}




