import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/components/gradient_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodboard/loading.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:intl/intl.dart';

class HomeHeader extends StatelessWidget {
  final User user;
  HomeHeader(this.user);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Firebase has encountered an error.");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.exists) {
              // If user data is there:
              Map<String, dynamic> data = snapshot.data.data();
              return HomeHeaderContent(user.email, data);
            }
            return Text("Firebase has encountered an error.");
          }
          return LoadingHeader();
        });
  }
}

class HomeHeaderContent extends StatelessWidget {
  final email;
  final userData;
  final String dateNow = DateFormat("EEEE, d MMMM y").format(DateTime.now());

  HomeHeaderContent(this.email, this.userData);

  @override
  Widget build(BuildContext context) {
    var userType = userData["userType"];
    var phone = userData["phoneNumber"];

    var headerItems = <Widget>[
      HeaderTitle(dateNow),
      SizedBox(height: header_spacing / 2),
      HeaderItem(Icons.email_rounded, email),
      Divider(color: header_item_color),
      HeaderItem(Icons.local_phone, phone),
      SizedBox(height: header_spacing),
      HeaderTitle("Statistics"),
      SizedBox(height: header_spacing / 2),
      // TODO: I can't find the specific icon for these, just change:
      (userType == "donor")
          ? HeaderItemWithContent(Icons.set_meal, "Successful Donations", "250")
          : SizedBox(),
      (userType == "rescuer")
          ? HeaderItemWithContent(Icons.set_meal, "Donations Rescued", "250")
          : SizedBox(),
    ];

    if (userType == "pantry") {
      headerItems.add(HeaderItemWithContent(
          Icons.set_meal, "Total Weight of Donations", "1000 kg"));
      headerItems.add(Divider(color: header_item_color));
      headerItems.add(
          HeaderItemWithContent(Icons.set_meal, "Donations Received", "250"));
    }

    return Container(
        color: header_background_color,
        padding: EdgeInsets.all(20),
        child: Column(
          children: headerItems,
        ));
  }
}

class HeaderTitle extends StatelessWidget {
  final String text;

  HeaderTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: style_header_title,
        ));
  }
}

class HeaderItem extends StatelessWidget {
  final IconData icon;
  final String text;

  HeaderItem(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Row(children: [
          GradientIcon(icon),
          SizedBox(width: 10),
          Text(
            text,
            style: style_header_item,
          )
        ]));
  }
}

class HeaderItemWithContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final String content;

  HeaderItemWithContent(this.icon, this.text, this.content);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            GradientIcon(icon),
            SizedBox(width: 10),
            Text(
              text,
              style: style_header_item,
            )
          ]),
          Text(
            content,
            style: style_header_title,
          )
        ]));
  }
}
