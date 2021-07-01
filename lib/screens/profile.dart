import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodboard/components/badge.dart';
import 'package:provider/provider.dart';

import 'package:foodboard/components/user_details.dart';
import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/utils/database.dart';


class Profile extends StatefulWidget {
  final String userType;

  Profile(this.userType);

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {  
  String role;
  String name;
  int numofDonations;

  final profile_style = TextStyle(color:text_green,fontWeight:FontWeight.bold, fontSize: 18);

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

     Widget _buildStatistics() {
      if (widget.userType=="donor") {
        return GetDonorDonations(user.uid);
      } else if (widget.userType=="rescuer"){
        return GetRescuerDonations(user.uid);
      }
        return SizedBox();
    }
  
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height * 0.03),
              GetUserDisplayName(user.uid),
              Text(getRole(), style: profile_style),
              SizedBox(height:MediaQuery.of(context).size.height * 0.02),
              UserDetails(user, numofDonations),
              _buildStatistics(), 
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              //add condition
              if (widget.userType != "pantry") 
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
                    GetBadge(5,user.uid),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GetBadge(10,user.uid),                     
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBadge(25,user.uid),     
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GetBadge(40,user.uid),                        
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
  final style = TextStyle(fontWeight:FontWeight.bold, fontSize: 24);

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

class GetDonorDonations extends StatelessWidget {
  final String uid;
  final style = TextStyle(fontWeight:FontWeight.bold, fontSize: 24);

  GetDonorDonations(this.uid);
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
                return HeaderItemWithContent(Icons.set_meal, "Successful Donations", "${data['donations']}");
              }

              return SizedBox();
            },
          );
  }
}

class GetRescuerDonations extends StatelessWidget {
  final String uid;
  final style = TextStyle(fontWeight:FontWeight.bold, fontSize: 24);

  GetRescuerDonations(this.uid);
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
                return HeaderItemWithContent(Icons.set_meal, "Donations Delivered", "${data['donations']}");
              }

              return SizedBox();
            },
          );
  }
}



class GetBadge extends StatelessWidget {
  final int quota;
  final String uid;
  final style = TextStyle(fontWeight:FontWeight.bold, fontSize: 24);

  GetBadge(this.quota,this.uid);
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
                return Badge(number: quota, donations:data['donations']);
                
              }

              return SizedBox();
            },
          );
  }
}