import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

class HomeTitleBar extends StatelessWidget {
  final String text;
  final Function press;
  final Gradient gradient;
  const HomeTitleBar({
    Key key,
    this.text,
    this.press,
    this.gradient,
  }) : super(key: key);

  final double barHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))),
        decoration: BoxDecoration(gradient: gradient),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: MediaQuery.of(context).padding.top + barHeight);
  }
}
