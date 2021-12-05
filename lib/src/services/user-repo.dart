import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepo{
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  //constructor
  UserRepo({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn}):
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<void> signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential userCredential = await this._firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential userCredential = await this._firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}