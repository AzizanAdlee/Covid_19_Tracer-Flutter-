import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_tracer/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as authh;

class AuthService {
  final authh.FirebaseAuth auth = authh.FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  CollectionReference vendors = FirebaseFirestore.instance.collection('vendor');
  CollectionReference get vaccinations => FirebaseFirestore.instance
      .collection('user')
      .doc(auth.currentUser!.uid)
      .collection("vacinationn");

  Future<Object?> register(String name, String email, String password,
      String number, String ic, String address, String state) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) => {
                //Set Data
                users.doc(result.user!.uid).set({
                  'name': name,
                  'email': email,
                  'number': number,
                  'ic': ic,
                  'address': address,
                  'state': state
                })
              });
      return auth.currentUser;
    } on authh.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email Already Exist';
      }
      return null;
    }
  }

  Future<String?> vendorr(
      String name, String address, String phonenum, String qrcode) async {
    String? id;
    vendors.add({
      'name': name,
      'userid': auth.currentUser!.uid,
      'address': address,
      'phonenum': phonenum,
      'qrcode': qrcode
    }).then((value) {
      id = value.id;
      // print(value.id);
    });
    return id;
  }

  Future<void> save(String number, String address, String state) async {
    try {
      users
          .doc(auth.currentUser!.uid)
          .update({'number': number, 'address': address, 'state': state});
    } on authh.FirebaseAuthException catch (e) {}
    //return null;
  }

  Future<Object?> login(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) => {
                //Get Document
                users.doc(result.user!.uid)
              });
      return null;
    } on authh.FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Stream<DocumentSnapshot> get user {
    return users.doc(auth.currentUser!.uid).snapshots();
  }

  Stream<User> get userr {
    return users
        .doc(auth.currentUser!.uid)
        .snapshots()
        .map((event) => User.fromFirestore(event));
  }

  Stream<QuerySnapshot> get isvendor {
    return vendors
        .where('userid', isEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> get vaccination => vaccinations.snapshots();
}
