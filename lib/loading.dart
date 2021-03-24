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
