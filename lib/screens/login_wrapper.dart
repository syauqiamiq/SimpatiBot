import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpati_bot/screens/home_page.dart';
import 'package:simpati_bot/screens/login_page.dart';

class LoginWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    return (firebaseUser == null) ? LoginPage() : HomePage();
  }
}
