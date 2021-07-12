import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  static Future uploadImage(File imageFile) async {
    final String userUID = FirebaseAuth.instance.currentUser.uid;
    Reference ref =
        FirebaseStorage.instance.ref('profile').child(userUID + ".jpeg");
    await ref.putFile(imageFile);
    print("SUKSES UPLOAD");
    return await ref.getDownloadURL();
  }
}
