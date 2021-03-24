import 'package:flutter/gestures.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/auth/category.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:foodboard/utils/auth_service.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/components/forms_header.dart';
import 'package:foodboard/home.dart';

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.only(top: 250, left:25),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
                          vertical: MediaQuery.of(context).size.height * 0.04),
                        height: MediaQuery.of(context).size.height * 1.25,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all( Radius.circular(30.0)),
                          color: Colors.white, 
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 5.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ]
                        ),
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
                            
                            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                            MainButton(
                              press: () { //FIX AUTH -- FIRESTORE
                                // context.read<AuthenticationService>().signUp(
                                //       email: _emailController.text.trim(),
                                //       password: _passwordController.text.trim(),
                                //     );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                  (route) => false,
                                );
                              },
                              text: "Post Donation",
                              gradient: LinearGradient(
                                colors: <Color>[
                                  light_green,
                                  dark_green,
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),                                                                                                         
                          ],                 
                        ),
                      )                      
                    )  
                  ],
                ),
              ),
              FormHeader(
                title: 'Donation Form', 
                subtitle: 'Please input as much information as you can about your donation.', 
                press: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
              )
            ] , 
          ),                           
        )
    );
  }
}