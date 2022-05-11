import 'package:cloud_firestore/cloud_firestore.dart';

class Vendor {
  final String name, address, phonenum, userid, qrcode;

  Vendor(
      {required this.name,
      required this.address,
      required this.phonenum,
      required this.userid,
      required this.qrcode});

  factory Vendor.fromFirestore(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;

    return Vendor(
        name: data['name'],
        address: data['address'],
        phonenum: data['phonenum'],
        userid: data['userid'],
        qrcode: data['qrcode']);
  }

  Map<String, dynamic> toMap(Vendor vendor) {
    return {
      'name': vendor.name,
      'address': vendor.address,
      'phonenum': vendor.phonenum,
      'userid': vendor.userid,
      'qrcode': vendor.qrcode
    };
  }
}
