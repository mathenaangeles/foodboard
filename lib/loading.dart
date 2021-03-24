import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodboard/constants.dart';

// This is by default, the Donor home.
// Change when back-end is set up.
// - Carlos
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: SpinKitRing(color: light_green, size: 50.0));
  }
}

class LoadingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: header_background_color,
        padding: EdgeInsets.all(20),
        child: SpinKitFadingFour(color: light_green, size: 20.0));
  }
}

class LoadingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        color: cards_background_color,
        child: SpinKitFadingFour(color: light_green, size: 20.0));
  }
}
