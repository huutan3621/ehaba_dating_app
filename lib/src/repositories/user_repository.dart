
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserRepository({required this.firebaseAuth});

  //Sign Up with email and password

  Future<User?> signUp(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');  //TODO handle email already exist
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User?> signIn(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "barry.allen@example.com",
          password: "SuperSecretPassword!"
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');             // TODO handle user-not-found
      } else if (e.code == 'user-not-found') {
        print('Wrong password provided for that user.');    //TODO handle user-not-found
      }
    }
  }

}
