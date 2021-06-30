import 'package:flutter/gestures.dart';
import 'package:foodboard/auth/category.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/utils/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/components/forms_header.dart';

import 'package:foodboard/home.dart';

class Donor extends StatefulWidget {
  @override
  _DonorState createState() => _DonorState();
}

class _DonorState extends State<Donor> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _bustypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    return Scaffold(
        backgroundColor: cards_background_color,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Transform.scale(
                scale: 1.5,
                child: Container(
                  child: Image.asset(
                    'assets/images/header.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  FormHeader(
                    title: 'Food Donor',
                    subtitle:
                        'Volunteer to pick up and drop off food donations depending on your availability.',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Category()),
                      );
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 30.0,
                            bottom: 30.0,
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.08,
                            vertical:
                                MediaQuery.of(context).size.height * 0.04),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 5.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: dark_green,
                                    fontSize: 28),
                              ),
                            ),
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "Enter your full name",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.account_circle,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _phonenumController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ], //enter numbers only
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "Enter your phone number",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _companyController,
                              decoration: InputDecoration(
                                labelText: "Company Name",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "Enter your company name",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.people,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                labelText: "Address",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "Enter your address",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.home,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _websiteController,
                              decoration: InputDecoration(
                                labelText: "Website",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "Enter your website URL",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.link,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _bustypeController,
                              decoration: InputDecoration(
                                labelText: "Type of Business",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: "Enter your type of business",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.work,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            MainButton(
                              press: () {
                                Database.addUserData(firebaseUser.uid, {
                                  'displayName': _nameController.text,
                                  'phoneNumber': _phonenumController.text,
                                  'company': _companyController.text,
                                  'address': _addressController.text,
                                  'website': _websiteController.text,
                                  'businessType': _bustypeController.text,
                                  'userType': 'donor'
                                });
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home('donor'),
                                  ),
                                  (route) => false,
                                );
                              },
                              text: "Complete",
                              gradient: LinearGradient(
                                colors: <Color>[
                                  light_green,
                                  dark_green,
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Divider(
                              height: 20,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Please review the ',
                                style:
                                    TextStyle(fontSize: 18, color: dark_grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'food handling ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: dark_green)),
                                  TextSpan(text: 'and '),
                                  TextSpan(
                                      text: 'food safety guidelines.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: dark_green)),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
