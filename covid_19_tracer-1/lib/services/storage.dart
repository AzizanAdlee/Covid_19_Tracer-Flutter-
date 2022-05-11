// import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  // Future<void> upload() async {
  //   File file =File('qrcode/');
  //   storage.ref('qrcode/testing1').putFile();

  //   try {
  //     await storage
  //       .ref()
  //   }
  // }

}
