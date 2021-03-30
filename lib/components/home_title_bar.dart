import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:provider/provider.dart';
import 'package:foodboard/utils/auth_service.dart';
import 'package:foodboard/auth/login.dart';

class HomeTitleBar extends StatelessWidget {
  final String uid;
  final Function press;
  final Gradient gradient = LinearGradient(colors: <Color>[
    light_green,
    dark_green,
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  HomeTitleBar({
    Key key,
    this.uid,
    this.press,
  }) : super(key: key);

  final double barHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return uid == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            decoration: BoxDecoration(gradient: gradient),
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: MediaQuery.of(context).padding.top + barHeight,
            child: Stack(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Center(child: GetUserDisplayName(uid))),
                ],
              ),
              IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (route) => false,
                    );
                  }),
            ]));
  }
}

class GetUserDisplayName extends StatelessWidget {
  final String uid;
  final style =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700);
  GetUserDisplayName(this.uid);
  @override
  Widget build(BuildContext context) {
    return uid == null
        ? Center(child: CircularProgressIndicator())
        : FutureBuilder<DocumentSnapshot>(
            future:
                FirebaseFirestore.instance.collection("users").doc(uid).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Firebase Error", style: style);
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                return Text("${data['displayName']}", style: style);
              }

              return Text("...", style: style);
            },
          );
  }
}
