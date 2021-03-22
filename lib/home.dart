import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:foodboard/components/home_title_bar.dart';
import 'package:foodboard/components/home_header.dart';
import 'package:foodboard/components/home_donations_list.dart';

class Home extends StatefulWidget {
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
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    return new Scaffold(
      body: new Column(
        children: [
          HomeTitleBar(
            press: () {},
            text: user.email, // TODO: Replace this with user's name
          ),
          HomeHeader(user),
          Container(
            color: header_background_color,
            child: new TabBar(
              labelStyle: style_header_tabs,
              labelColor: header_title_color,
              indicatorColor: light_green,
              controller: _controller,
              tabs: [
                Tab(text: "Pending"),
                Tab(text: "Confirmed"),
                Tab(text: "Rejected"),
                Tab(text: "Received"),
              ],
            ),
          ),
          new Expanded(
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                HomeDonationsList(dummy_data),
                HomeDonationsList(dummy_data),
                HomeDonationsList(dummy_data),
                HomeDonationsList(dummy_data),
              ],
            ),
          ),
        ],
      ),
    );
  }
}