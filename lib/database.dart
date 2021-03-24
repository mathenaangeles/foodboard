import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  static CollectionReference donations =
      FirebaseFirestore.instance.collection("donations");

  static Future<void> addUserData(String uid, Map<String, dynamic> userData) {
    return users
        .doc(uid)
        .set(userData)
        .then((v) => print("Add user success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<void> addDonation(Map<String, dynamic> donationData) {
    return donations
        .add(donationData)
        .then((v) => print("Add donation success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<void> acceptDonation(String pantryID, String donationID) {
    // TODO: Validation?
    return donations
        .doc(donationID)
        .update({"pantryID": pantryID, "status": "accepted"})
        .then((v) => print("Accept success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }
}
