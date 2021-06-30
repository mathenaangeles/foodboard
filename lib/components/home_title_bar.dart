import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:foodboard/auth/login.dart';
import 'package:intl/intl.dart';

class HomeTitleBar extends StatelessWidget {
  final String dateNow = DateFormat("EEEE, d MMMM y").format(DateTime.now());

  HomeTitleBar({Key key}) : super(key: key);

  final double barHeight = 50.0;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.07, bottom: 20.0),
      child: Container(
          color: header_background_color,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
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
                ),
                Spacer(),
                //TO-DO: fix logout function
                GestureDetector(
                  onTap: () async {
                    await _firebaseAuth.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Icon(
                    Icons.logout,
                    color: Colors.green,
                    size: 30.0,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
