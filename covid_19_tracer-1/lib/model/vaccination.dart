import 'package:cloud_firestore/cloud_firestore.dart';

class Vaccination {
  final String manufacterer, batch, location, qrcode;

  Vaccination(
      {
      // required this.name,
      // required this.ic,
      required this.manufacterer,
      required this.batch,
      required this.location,
      required this.qrcode});

  factory Vaccination.fromFirestore(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;

    return Vaccination(
        // name: data['name'],
        // ic: data['ic'],
        manufacterer: data['manufacterer'],
        batch: data['batch'],
        location: data['location'],
        qrcode: data['qrcode']);
  }
}
