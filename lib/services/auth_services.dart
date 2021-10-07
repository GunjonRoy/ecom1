import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;

  Future signInWithEmailAndPassword(var email, var password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    //print(email.toString()+password.toString());
  }
  Future createAccountWithEmailAndPassword (var name, var email, var password) async {

    auth.FirebaseUser credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    print(">>>>>>>>>>>>>OK<<<<<<<<<<<<<<<<<");
    credential.updateProfile(name);
    //print(">>>>>>>>>>>>>OK<<<<<<<<<<<<<<<<<");
    //print(">>>>>>>>>>>>>>>"+credential.displayName+"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
//    if (credential.isAnonymous != null) {
//      //_firebaseAuth.currentUser!.updateDisplayName(name.toString());
//      //credential.updateProfile(name.toString());
//      await firestore
//          .collection('Users')
//          .doc(_firebaseAuth.currentUser!.uid)
//          .set({
//        'Name':name.toString(),
//        'email':_firebaseAuth.currentUser!.email,
//        'address':address.toString(),
//        'uid':_firebaseAuth.currentUser!.uid
//      });
//    }
  }
}
