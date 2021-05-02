import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      String _error = e.message;
      print(_error);
      return _error;
    }
  }

  static Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } catch (e) {
      String _error = e.message;
      print(_error);
      return _error;
    }
  }

  static Future signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get firebaseUserStream => _auth.authStateChanges();
}
