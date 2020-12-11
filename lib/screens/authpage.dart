import 'package:flutter/material.dart';
import 'package:education_master/widgets/authForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void _submitAuthForm(
        String email, String password, bool isLogin, BuildContext ctx) async {
      UserCredential authResult;

      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.pushNamed(context, '/videos');
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    }

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: AuthForm(
        _submitAuthForm,
      ),
    );
  }
}
