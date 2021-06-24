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

  static Future<void> deleteDonation(String donationID) {
    return donations
        .doc(donationID)
        .delete()
        .then((v) => print("Delete donation success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<void> updateDonation(
      String donationID,
      String category,
      String subcategory,
      String expiry,
      String estWeight,
      String deliverFrom,
      String notes) {
    return donations
        .doc(donationID)
        .update({
          "category": category,
          "subcategory": subcategory,
          "expiry": expiry,
          "estWeight": estWeight,
          "deliverFrom": deliverFrom,
          "notes": notes,
        })
        .then((v) => print("Update donation success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<void> getDeliverTo(String pantryID, String donationID) async {
    DocumentSnapshot pantry = await FirebaseFirestore.instance
        .collection("users")
        .doc(pantryID)
        .get();
    var deliverTo = pantry.data()['address'];
    return deliverTo;
  }

  static Future<void> acceptDonation(String pantryID, String donationID) {
    return donations
        .doc(donationID)
        .update({
          "pantryID": pantryID,
          "status": "accepted",
          "deliverTo": getDeliverTo(pantryID, donationID),
        })
        .then((v) => print("Accept success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<void> rejectDonation(String pantryID, String donationID) {
    return donations
        .doc(donationID)
        .update({"pantryID": pantryID, "status": "rejected"})
        .then((v) => print("Rejected success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<void> acceptDonationDelivery(
      String rescuerID, String donationID) {
    return donations
        .doc(donationID)
        .update({"rescuerID": rescuerID})
        .then((v) => print("Rescuer accept success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }
}
