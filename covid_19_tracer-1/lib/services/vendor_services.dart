import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracer/model/vendor.dart';

class VendorServices {
  CollectionReference refs = FirebaseFirestore.instance.collection('vendor');

  Future<DocumentReference> add({required Vendor vendor}) =>
      refs.add(vendor.toMap(vendor));

  Stream<Vendor>? vendor(String id) =>
      refs.doc(id).snapshots().map((event) => Vendor.fromFirestore(event));
}
