import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/mechanic_model.dart';

class MechProvider with ChangeNotifier {
  List<Mechanics> mechList = [];
  late Mechanics mechanics;

  fetchMechData() async {
    List<Mechanics> newMechList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('mechanic').get();
    value.docs.forEach(
      (element) {
        mechanics = Mechanics(
          mechanicName: element.get("mechName"),
          mechanicPhone: element.get("mechPhone"),
          mechanicEmail: element.get("mechEmail"),
        );
        newMechList.add(mechanics);
      },
    );
    mechList = newMechList;
    notifyListeners();
  }

  List<Mechanics> get getMechanicsData {
    return mechList;
  }
}
