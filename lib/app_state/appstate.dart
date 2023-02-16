import 'package:flutter/material.dart';
import 'package:motomechdashboard/models/appointments.dart';

import '../firebase_services/firebaseService.dart';
import '../models/mechanic.dart';

class Appstate extends ChangeNotifier {
  FirestoreService firebaseService = FirestoreService();
  List<Mechanic> _mechanicList = [];
  List<Mechanic> get mechanicList => _mechanicList;

  List<Appointments> _appointmentsList = [];
  List<Appointments> get appointmentsList => _appointmentsList;

  Appstate() {
    print("App State initialized");
    fetchMechanics();
    fetchAppointments();
    // checkIfUserExists();
    // FirebaseAuth.instance.signOut();
  }

  Future<void> fetchMechanics() async {
    print("fetchProductCategory AppState:");
    _mechanicList = (await firebaseService.fetchMechanics())!;
    notifyListeners();
  }

  Future<void> fetchAppointments() async {
    print("fetchAppointments AppState:");
    _appointmentsList = (await firebaseService.fetchAppointments())!;
    print("appointments fetched: $_appointmentsList");
    notifyListeners();
  }
}
