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
  int _value = 1;

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
                    padding: EdgeInsets.only(top: 220, left: MediaQuery.of(context).size.width * 0.04),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
                          vertical: MediaQuery.of(context).size.height * 0.04),
                        height: MediaQuery.of(context).size.height * 0.35,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(                              
                                  "Food Category Name",
                                  style: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: DropdownButton(
                                value: _value,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                            "Select food category name", 
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 1,
                                  ),                                  
                                  DropdownMenuItem(
                                    child: Text(
                                            "Vegetables, fruits and products",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                            "Grain and products",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                            "Starchy roots products",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text(
                                            "Meat and other high protein food and products",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 5
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(                              
                                  "Food Subcategory Name",
                                  style: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),                
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            Container(
                              child: DropdownButton(
                                value: _value,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                            "Select food subcategory name",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 1,
                                  ),                                  
                                  DropdownMenuItem(
                                    child: Text(
                                            "Fresh vegetable and fruit",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                            "Frozen vegetable and fruit",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 3,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                            "Dried vegetable and fruit",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                    value: 4
                                  ),
                                  DropdownMenuItem(
                                      child: Text(
                                            "Fried/Baked vegetable and fruit",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 5
                                  ), 
                                  DropdownMenuItem(
                                      child: Text(
                                            "Canned/Bottled vegetable and fruit",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 6
                                  ),
                                  DropdownMenuItem(
                                      child: Text(
                                            "Whole grains, cereals and products",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 7
                                  ),  
                                  DropdownMenuItem(
                                      child: Text(
                                            "Noodles or pasta",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 8
                                  ), 
                                  DropdownMenuItem(
                                      child: Text(
                                            "Hot or cold cereals",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 9
                                  ),  
                                  DropdownMenuItem(
                                      child: Text(
                                            "Bread and cakes",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 10
                                  ),  
                                  DropdownMenuItem(
                                      child: Text(
                                            "Buiscuit, cookies or crackers",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 11
                                  ), 
                                  DropdownMenuItem(
                                      child: Text(
                                            "Chips",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 11
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Flour",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 12
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Fresh starchy roots",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 13
                                  ),
                                  DropdownMenuItem(
                                      child: Text(
                                            "Frozen starchy roots",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 14
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Dried starchy roots",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 15
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Fried/Baked starchy roots",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 16
                                  ), 
                                    DropdownMenuItem(
                                      child: Text(
                                            "Fresh/Frozen meat",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 17
                                  ),
                                  DropdownMenuItem(
                                      child: Text(
                                            "Fresh/Frozen poultry",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 18
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Canned meat or poultry",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 19
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Canned fish or seafood",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 20
                                  ), 
                                  DropdownMenuItem(
                                      child: Text(
                                            "Eggs",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 21
                                  ),    
                                  DropdownMenuItem(
                                      child: Text(
                                            "Dried or canned beans and peas",
                                            style: TextStyle(fontSize: 16)
                                            ),
                                      value: 22
                                  ),                                                                                                                                                                                                                                                                                                                                                                                                                    
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }
                              ),
                            ),                            
                          ],                 
                        ),
                      )                      
                    )  
                  ],
                ),
              ),   
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [            
                  Padding(
                    padding: EdgeInsets.only(top: 480, left: MediaQuery.of(context).size.width * 0.04),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08,
                          vertical: MediaQuery.of(context).size.height * 0.04),
                        height: MediaQuery.of(context).size.height * 0.62,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Expiration Date",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter the expiration date",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),  
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Address",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter your address for pick up",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixIcon: Icon(
                                  Icons.home,
                                  color: dark_green,
                                  size: 28,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Estimated Weight",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter the estimated weight in kg",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                suffixText: 'kg',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),  
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Notes",
                                labelStyle: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                hintText: "Enter additional information...",
                                hintStyle: TextStyle(height: 2, fontSize: 16),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: dark_green),
                                ),
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
              Padding(
                padding: const EdgeInsets.only(top: 950, left: 20, right: 20, bottom: 50),
                child: MainButton(
                  press: () { //FIX AUTH -- FIRESTORE
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