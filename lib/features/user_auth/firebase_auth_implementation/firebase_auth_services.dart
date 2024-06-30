import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/global/common/utils.dart';
import 'package:flutter/material.dart';


class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The email is already in use"); 
      } else {
        showSnackBar(context, "Error encountered while signing up: ${e.code}"); 
      }
    }
    return null;
  }

  Future<User?> signInpWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showSnackBar(context, "Invalid email or password"); 
      } else {
        showSnackBar(context, "Error encountered while logging in: ${e.code}"); 
      }
    }
    return null;
  }
}
