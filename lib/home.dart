import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodboard/donation_form.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:foodboard/components/home_title_bar.dart';
import 'package:foodboard/components/home_header.dart';
import 'package:foodboard/components/home_donations_list.dart';

// This is by default, the Donor home.
// Change when back-end is set up.
// - Carlos
class Home extends StatefulWidget {
  final String userType;

  Home(this.userType);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  // Just some placeholder data! Should move them
  // to their own wrapper classes once backend is
  // set up. - Carlos

  var dummy_data = [
    [
      10245,
      "Frozen Food",
      "Metro Manila, Philippines",
      ["Chicken", "Pork", "Fish"],
      DateTime.now(),
      "Taytay, Rizal",
      1.2,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan, ipsum at eleifend consequat, diam libero sollicitudin lectus, at convallis mi ex id mauris."
    ],
    [
      10246,
      "Frozen Food",
      "Metro Manila, Philippines",
      ["Chicken", "Pork", "Fish"],
      DateTime.now(),
      "Taytay, Rizal",
      1.2,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan, ipsum at eleifend consequat, diam libero sollicitudin lectus, at convallis mi ex id mauris."
    ],
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        length: (widget.userType == "rescuer") ? 3 : 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    return new Scaffold(
        body: new Column(
          children: [
            HomeTitleBar(
              press: () {},
              uid: user.uid, // TODO: Replace this with user's name
            ),
            HomeHeader(user),
            Container(
              color: header_background_color,
              child: new TabBar(
                labelStyle: style_header_tabs,
                labelColor: header_title_color,
                indicatorColor: light_green,
                controller: _controller,
                tabs: (widget.userType == "rescuer")
                    ? [
                        Tab(text: "Pending"),
                        Tab(text: "Accepted"),
                        Tab(text: "Received"),
                      ]
                    : [
                        Tab(text: "Pending"),
                        Tab(text: "Accepted"),
                        Tab(text: "Rejected"),
                        Tab(text: "Received"),
                      ],
              ),
            ),
            new Expanded(
              child: new TabBarView(
                controller: _controller,
                children: (widget.userType == "rescuer")
                    ? <Widget>[
                        HomeDonationsList(user.uid, widget.userType, "pending"),
                        HomeDonationsList(
                            user.uid, widget.userType, "accepted"),
                        HomeDonationsList(
                            user.uid, widget.userType, "received"),
                      ]
                    : <Widget>[
                        HomeDonationsList(user.uid, widget.userType, "pending"),
                        HomeDonationsList(
                            user.uid, widget.userType, "accepted"),
                        HomeDonationsList(
                            user.uid, widget.userType, "rejected"),
                        HomeDonationsList(
                            user.uid, widget.userType, "received"),
                      ],
              ),
            ),
          ],
        ),
        floatingActionButton: (widget.userType == "donor")
            ? FloatingActionButton(
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: <Color>[
                            light_green,
                            dark_green,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationForm(user.uid)));
                },
              )
            : SizedBox());
  }
}
