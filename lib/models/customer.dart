import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  //late String mechanicId;
  //late Timestamp mechDob;
  late String customerName;
  late String custPhone;
  late String custEmail;
  late CustAddress custAddress;

  Customer(
      {//required this.mechDob,
      //required this.mechanicId,
      required this.customerName,
      required this.custPhone,
      required this.custAddress, 
      required this.custEmail,
      });

  factory Customer.fromSnapshot(DocumentSnapshot snapshot) {
    var custAddress = snapshot.get('custAddress') as Map<String, dynamic>;
    return Customer(
      custAddress: CustAddress.fromJson(custAddress),
      //custDob: snapshot.get('custDob'),
      //mechanicId: snapshot.id,
      custPhone: snapshot.get('custPhone'),
      customerName: snapshot.get('custName'),
      custEmail: snapshot.get('custEmail'),
    );
  }
}

class CustAddress {
  String pincode;
  String area;
  CustAddress({
    required this.pincode,
    required this.area,
  });
  CustAddress.fromJson(Map<String, dynamic> jsonData)
      : pincode = jsonData['pincode'],
        area = jsonData['area'];
}

