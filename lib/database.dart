import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  static Future<void> addUserData(String uid, Map<String, dynamic> userData) {
    return users
        .doc(uid)
        .set(userData)
        .then((v) => print("Add user success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }
}
