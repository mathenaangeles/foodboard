import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:foodboard/components/home_title_bar.dart';
import 'package:foodboard/components/home_header.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    return Scaffold(
        body: Column(
      children: [
        HomeTitleBar(
          press: () {},
          text: user.email, // TODO: Replace this with user's name
          gradient: LinearGradient(colors: <Color>[
            light_green,
            dark_green,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        HomeHeader(user),
      ],
    ));
  }
}
