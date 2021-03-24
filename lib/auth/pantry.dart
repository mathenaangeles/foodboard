import 'package:flutter/gestures.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/auth/category.dart';
import 'package:foodboard/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodboard/utils/auth_service.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/components/forms_header.dart';
import 'package:foodboard/home.dart';

class Pantry extends StatefulWidget {
  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _bustypeController = TextEditingController();
  final TextEditingController _beneficiaryController = TextEditingController();
  final TextEditingController _foodneededController = TextEditingController();
  final TextEditingController _rescueareaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    return Scaffold(
        backgroundColor: cards_background_color,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 400.0,
                alignment: Alignment(0.0, 0.0),
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(1.0, 0.0),
                    colors: [light_green, dark_green],
                  ),
                  borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width, 400.0)),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 250,
                            left: MediaQuery.of(context).size.width * 0.04),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.08,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.04),
                          height: MediaQuery.of(context).size.height * 1.5,
                          width: 380,
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
                                    Icons.location_city,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              TextField(
                                controller: _beneficiaryController,
                                decoration: InputDecoration(
                                  labelText: "Beneficiary Type",
                                  labelStyle: TextStyle(
                                      color: dark_grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: "Enter your type of beneficiary",
                                  hintStyle: TextStyle(height: 2, fontSize: 16),
                                  suffixIcon: Icon(
                                    Icons.location_city,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              TextField(
                                controller: _foodneededController,
                                decoration: InputDecoration(
                                  labelText: "Types of Food Needed",
                                  labelStyle: TextStyle(
                                      color: dark_grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: "Enter the types of food needed",
                                  hintStyle: TextStyle(height: 2, fontSize: 16),
                                  suffixIcon: Icon(
                                    Icons.drive_eta,
                                    color: dark_green,
                                    size: 28,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: dark_green),
                                  ),
                                ),
                              ),
                              Text(
                                  'Specify the types of food that you can receive.',
                                  style: TextStyle(
                                    color: dark_green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              TextField(
                                controller: _rescueareaController,
                                decoration: InputDecoration(
                                  labelText: "Rescue Areas",
                                  labelStyle: TextStyle(
                                      color: dark_grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: "Enter rescue areas (optional)",
                                  hintStyle: TextStyle(height: 2, fontSize: 16),
                                  suffixIcon: Icon(
                                    Icons.shopping_cart,
                                    color: dark_green,
                                    size: 28,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: dark_green),
                                  ),
                                ),
                              ),
                              Text(
                                  'Leave this field blank if you cannot pick up food.',
                                  style: TextStyle(
                                    color: dark_green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              MainButton(
                                press: () {
                                  // TODO: Validation maybe?
                                  Database.addUserData(firebaseUser.uid, {
                                    'displayName': _companyController.text,
                                    'phoneNumber': _phonenumController.text,
                                    'address': _addressController.text,
                                    'website': _websiteController.text,
                                    'businessType': _bustypeController.text,
                                    'beneficiary': _beneficiaryController.text,
                                    'foodNeeded': _foodneededController.text,
                                    'rescueArea': _rescueareaController.text,
                                    'userType': 'pantry'
                                  });
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home('pantry'),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Divider(
                                height: 20,
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                            fontWeight: FontWeight.bold,
                                            color: dark_green)),
                                    TextSpan(text: 'and '),
                                    TextSpan(
                                        text: 'food safety guidelines.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: dark_green)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              FormHeader(
                title: 'Food Pantry',
                subtitle:
                    'Register as a distribution center to start accepting food from donors on the app.',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Category()),
                  );
                },
              )
            ],
          ),
        ));
  }
}
