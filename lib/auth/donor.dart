import 'package:flutter/gestures.dart';
import 'package:foodboard/auth/category.dart';
import 'package:foodboard/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:foodboard/utils/auth_service.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/components/forms_header.dart';

import 'package:foodboard/home.dart';

class Donor extends StatefulWidget {
  @override
  _DonorState createState() => _DonorState();
}

class _DonorState extends State<Donor> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                        height: 750,
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Professional Field",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter professional field",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.people,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Rescue Areas",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter rescue areas",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.location_city,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            Text(
                              'Enter the areas you are willing to rescue food from.',
                              style: TextStyle(color: dark_green, fontSize: 14, fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Delivery Areas",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter delivery areas",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.drive_eta,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            Text(
                              'Enter the areas you are willing to deliver food to.',
                              style: TextStyle(color: dark_green, fontSize: 14, fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Means of Transportation",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter means of transporation",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.shopping_cart,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                            MainButton(
                              press: () {
                                context.read<AuthenticationService>().signUp(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            Divider(
                              height:20,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Please review the ',
                                style: TextStyle(fontSize: 18, color: dark_grey),
                                children: <TextSpan>[
                                  TextSpan(text: 'food handling ', style: TextStyle(fontWeight: FontWeight.bold, color: dark_green)),
                                  TextSpan(text: 'and '),
                                  TextSpan(text: 'food safety guidelines.', style: TextStyle(fontWeight: FontWeight.bold, color: dark_green)),
                                ],
                              ),
                            )                                                                                                         
                          ],                 
                        ),
                      )                      
                    )  
                  ],
                ),
              ),
              FormHeader(
                title: 'Food Rescuer', 
                subtitle: 'Volunteer to pick up and drop off food donations depending on your availability.', 
                press: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Category()),
                    );
                  },
              )
            ] , 
          ),                           
        )
    );
  }
}