import 'package:flutter/material.dart';

import '../firebase_services/firebaseService.dart';
import '../models/mechanic.dart';

class Appstate extends ChangeNotifier {
  FirestoreService firebaseService = FirestoreService();
  // List<ProductCategories> _productCategory = [];
  // List<ProductCategories> get productCategory => _productCategory;
  List<Mechanic> _mechanicList = [];
  List<Mechanic> get mechanicList => _mechanicList;

  Appstate() {
    print("App State initialized");
    fetchMechanics();
    // checkIfUserExists();
    // FirebaseAuth.instance.signOut();
  }

  Future<void> fetchMechanics() async {
    print("fetchProductCategory AppState:");
    _mechanicList = (await firebaseService.fetchMechanics())!;
    notifyListeners();
  }
}
