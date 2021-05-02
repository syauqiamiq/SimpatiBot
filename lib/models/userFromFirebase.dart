import 'package:firebase_auth/firebase_auth.dart';

class UserDB {
  static final String userUid = FirebaseAuth.instance.currentUser.uid;
}
