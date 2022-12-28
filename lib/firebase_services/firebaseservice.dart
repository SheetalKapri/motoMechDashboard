import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/mechanic.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Mechanic> item = [];

  ///ADD SERVICE
  Future<List<Mechanic>?> fetchMechanics() async {
    print("FIREBASE SERVICE FUNC fetchProductCategory");
    var response = await _db.collection("mechanic").get();
    try {
      //print(response.docs.first.data());
      print("in firebase services");
      //print(response.docs.last.data());

      return response.docs.map((e) => Mechanic.fromSnapshot(e)).toList();
    } catch (error) {
      print("something wrong $error");
      return null;
    }
  }
}
