import 'package:assignment/Authentication/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authenticate {
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      saveToFirestore(userCredential.user!.uid, null,null);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email,
              password: password);
      saveToFirestore(userCredential.user!.uid, email, name);
      return userCredential;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> getUserDetails()async{
    String uid=FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
  }

  Future<void> saveToFirestore(String uid, String? email, String? name) async {
    var users = FirebaseFirestore.instance.collection('Users');
    if (name != null) {
      await users.doc(uid).set({
        'displayName': name,
        'email': email,
        'lastLogin': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } else {
      await users.doc(uid).set({
        'lastLogin': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

   Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}
