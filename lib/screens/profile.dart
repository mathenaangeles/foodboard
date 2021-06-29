import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodboard/components/badge.dart';
import 'package:provider/provider.dart';

import 'package:foodboard/components/user_details.dart';
import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

class Profile extends StatefulWidget {
  final String userType;

  Profile(this.userType);

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {  
  String role;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    String getRole(){
      if (widget.userType=="donor"){
        role = "Food Donor";

      } else if (widget.userType == "rescuer"){
        role = "Food Rescuer";

      } else if (widget.userType == "pantry"){
        role = "Food Pantry";
      }

      return role;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height * 0.03),
              Text('Gianna Burgos', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 24)),
              Text(getRole(), style: TextStyle(color:text_green,fontWeight:FontWeight.bold, fontSize: 18)),
              SizedBox(height:MediaQuery.of(context).size.height * 0.02),
              UserDetails(user),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              //add condition
              if (widget.userType != "rescuer") 
                Align(
                  alignment: Alignment.topLeft,
                  child: 
                    Text('My Badges', 
                      style: TextStyle(
                        color:Colors.black, 
                        fontSize: 18, 
                        fontWeight: FontWeight.bold
                      )
                    )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Badge(number:"5"),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Badge(number:"10"),                     
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Badge(number:"25"),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Badge(number:"40"),                     
                  ],
                ) 
            ],
          ),
        ),
      )
    );
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