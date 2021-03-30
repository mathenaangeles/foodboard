import 'package:foodboard/constants.dart';
import 'package:flutter/material.dart';

import 'package:foodboard/auth/donor.dart';
import 'package:foodboard/auth/rescuer.dart';
import 'package:foodboard/auth/pantry.dart';

import '../constants.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cards_background_color,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.08),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.08),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Select Category',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: dark_green,
                                        fontSize: 28)),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Choose the category that best describes you and your needs.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: dark_grey,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Card(
                                elevation: 5.0,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.green.withAlpha(30),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donor()),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/donor.png',
                                        height: 150,
                                        width: 400,
                                        fit: BoxFit.cover,
                                      ),
                                      ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8.0, bottom: 3.0),
                                          child: Text(
                                            'Food Donor',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: dark_green,
                                                fontSize: 18),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 10.0),
                                          child: Text(
                                            'Donate food to communities in need. We will match your supply to local demand.',
                                            style: TextStyle(
                                                color: dark_grey, fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Card(
                                elevation: 5.0,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.green.withAlpha(30),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Rescuer()),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/rescuer.png',
                                        height: 150,
                                        width: 400,
                                        fit: BoxFit.cover,
                                      ),
                                      ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8.0, bottom: 3.0),
                                          child: Text(
                                            'Food Rescuer',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: dark_green,
                                                fontSize: 18),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 10.0),
                                          child: Text(
                                            'Volunteer to pick up and drop off food donations depending on your availability.',
                                            style: TextStyle(
                                                color: dark_grey, fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Card(
                                elevation: 5.0,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.green.withAlpha(30),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Pantry()),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/pantry.png',
                                        height: 150,
                                        width: 400,
                                        fit: BoxFit.cover,
                                      ),
                                      ListTile(
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8.0, bottom: 3.0),
                                          child: Text(
                                            'Food Pantry',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: dark_green,
                                                fontSize: 18),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 10.0),
                                          child: Text(
                                            'Register as a distribution center to start accepting food from donors on the app.',
                                            style: TextStyle(
                                                color: dark_grey, fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                            ],
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
