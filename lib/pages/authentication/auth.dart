import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_1/pages/authentication/database.dart';
import 'package:project_1/pages/authentication/sign_in.dart';
import 'package:project_1/pages/first.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userdetails = result.user;

    if (result != null) {
      Map<String, dynamic> userInfoMap = {
        "email": userdetails!.email,
        "name": userdetails.displayName,
        "imgUrl": userdetails.photoURL,
        "id": userdetails.uid,
      };
      await DatabaseMethods()
          .addUser(userdetails.uid, userInfoMap)
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FirstScreen(
                      userName: userdetails.displayName ?? 'user',
                    )));
      });
    }
  }
}
