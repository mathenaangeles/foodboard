import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:provider/provider.dart';
import 'package:foodboard/utils/auth_service.dart';
import 'package:foodboard/auth/login.dart';
import 'package:intl/intl.dart';

class HomeTitleBar extends StatelessWidget {
  final String dateNow = DateFormat("EEEE, d MMMM y").format(DateTime.now());

  HomeTitleBar({Key key}) : super(key: key);

  final double barHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.07, bottom: 20.0),
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'FOOD',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: light_green,
                fontSize: 24,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'BOARD',
                    style: TextStyle(
                      color: dark_grey,
                    )),
              ],
            ),
          ),
          Text(dateNow,
              style: TextStyle(color: dark_grey, fontWeight: FontWeight.bold))
        ],
      )),
    );
  }
}
