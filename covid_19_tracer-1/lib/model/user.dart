import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid, name, address, email, ic, state, phonenum;
  final List<Timestamp>? vaccination;

  User(
      {required this.uid,
      required this.name,
      required this.address,
      required this.email,
      required this.ic,
      required this.state,
      required this.phonenum,
      this.vaccination});

  factory User.fromFirestore(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;

    return User(
        uid: snapshot.id,
        name: data['name'],
        phonenum: data['number'],
        address: data['address'],
        email: data['email'],
        ic: data['ic'],
        state: data['state'],
        vaccination:
            data['vaccination'] == null ? [] : List.from(data['vaccination']));
  }
}
