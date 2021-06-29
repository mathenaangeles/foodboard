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

  static Future<String> getDeliverTo(String pantryID, String donationID) async {
    DocumentSnapshot pantry = await FirebaseFirestore.instance
        .collection("users")
        .doc(pantryID)
        .get();
    var deliverTo = pantry.data()['address'];
    return deliverTo;
  }

  static Future<void> acceptDonation(String pantryID, String donationID) async {
    var deliverTo = await getDeliverTo(pantryID, donationID);
    return donations
        .doc(donationID)
        .update({
          "pantryID": pantryID,
          "status": "accepted",
          "deliverTo": deliverTo,
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

  static Future<void> deliverDonationDelivery(
      String rescuerID, String donationID) async {
    // Increment counters
    var donorID = await getDonationDonorID(donationID);
    var donos = await getDonorDonations(donorID);
    var deliveries = await getRescuerDeliveries(rescuerID);
    await updateRescuerDeliveries(rescuerID, deliveries + 1);
    await updateDonorDonations(donorID, donos + 1);

    print("Updated donations $donos:$donorID");
    print("Updated deliveries $deliveries:$rescuerID");

    // Update donation status
    return donations
        .doc(donationID)
        .update({"status": "received"})
        .then((v) => print("Rescuer 'mark as delivered' success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<int> getRescuerDeliveries(String rescuerID) async {
    DocumentSnapshot rescuer = await FirebaseFirestore.instance
        .collection("users")
        .doc(rescuerID)
        .get();

    var deliveries = rescuer.data()['deliveries'];

    if (deliveries == null) {
      print("No deliveries field set! Setting up one now...");
      await updateRescuerDeliveries(rescuerID, 0);
      deliveries = 0;
    }

    return deliveries;
  }

  static Future<void> updateRescuerDeliveries(
      String rescuerID, int deliveries) async {
    return users
        .doc(rescuerID)
        .update({"deliveries": deliveries})
        .then((v) => print("Rescuer delivery count update success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }

  static Future<String> getDonationDonorID(String donationID) async {
    DocumentSnapshot rescuer = await FirebaseFirestore.instance
        .collection("donations")
        .doc(donationID)
        .get();

    var donorID = rescuer.data()['donorID'];
    return donorID;
  }

  static Future<int> getDonorDonations(String donorID) async {
    DocumentSnapshot donor =
        await FirebaseFirestore.instance.collection("users").doc(donorID).get();

    var donations = donor.data()['donations'];

    if (donations == null) {
      print("No donations field set! Setting up one now...");
      await updateDonorDonations(donorID, 0);
      donations = 0;
    }

    return donations;
  }

  static Future<void> updateDonorDonations(
      String donorID, int donations) async {
    return users
        .doc(donorID)
        .update({"donations": donations})
        .then((v) => print("Donor donations count update success!"))
        .catchError((e) => print("Firebase failed! $e"));
  }
}
