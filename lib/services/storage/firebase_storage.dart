import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:simpati_bot/models/userFromFirebase.dart';

class StorageServices {
  static Future uploadImage(File imageFile) async {
    // String fileName = basename(imageFile.path);
    Reference ref =
        FirebaseStorage.instance.ref('profile').child(UserDB.userUid + ".jpeg");
    await ref.putFile(imageFile);
    print("SUKSES UPLOAD");
    return await ref.getDownloadURL();
  }
}
