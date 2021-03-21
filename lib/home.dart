import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:foodboard/components/home_title_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HomeTitleBar(
          press: () {},
          text: "Juan Dela Cruz", // TODO: Replace this with user's name
          gradient: LinearGradient(colors: <Color>[
            light_green,
            dark_green,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        )
      ],
    ));
  }
}
