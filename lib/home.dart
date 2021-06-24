import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodboard/donation_form.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:foodboard/components/home_title_bar.dart';
import 'package:foodboard/components/home_header.dart';
import 'package:foodboard/components/home_donations_list.dart';

class Home extends StatefulWidget {
  final String userType;

  Home(this.userType);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        length: (widget.userType == "rescuer") ? 3 : 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    return user == null
        ? Container()
        : Scaffold(
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
                            HomeDonationsList(
                                user.uid, widget.userType, "pending"),
                            HomeDonationsList(
                                user.uid, widget.userType, "accepted"),
                            HomeDonationsList(
                                user.uid, widget.userType, "received"),
                          ]
                        : <Widget>[
                            HomeDonationsList(
                                user.uid, widget.userType, "pending"),
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
                              builder: (context) =>
                                  DonationForm(user.uid, false)));
                    },
                  )
                : SizedBox());
  }
}
