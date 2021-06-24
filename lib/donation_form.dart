import 'package:flutter/gestures.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/components/forms_header.dart';

import 'constants.dart';

class DonationForm extends StatefulWidget {
  final uid;
  final bool isUpdating;
  final donationID;
  final donationCategory;
  final donationSubcategory;
  final donationExpiry;
  final donationAddress;
  final donationWeight;
  final donationNotes;

  DonationForm(
    this.uid,
    this.isUpdating, [
    this.donationID,
    this.donationCategory = "",
    this.donationSubcategory = "",
    this.donationExpiry = "",
    this.donationAddress = "",
    this.donationWeight = "",
    this.donationNotes = "",
  ]);

  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  DateTime selectedDate = DateTime.now();
  String _category = "Select food category";
  String _subcategory = "Select food subcategory";
  TextEditingController _addressController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.isUpdating) {
      _category = widget.donationCategory;
      _subcategory = widget.donationSubcategory;
      _addressController = TextEditingController(text: widget.donationAddress);
      _weightController = TextEditingController(text: widget.donationWeight);
      _notesController = TextEditingController(text: widget.donationNotes);
      _dateController = TextEditingController(text: widget.donationExpiry);
    }
    var rawCategories = [
      "Select food category",
      "Vegetables and Fruits",
      "Grain",
      "Starchy Roots",
      "Meat",
      "Dairy",
      "Beverages",
      "Others",
    ];
    var rawSubcategories = [
      "Select food subcategory",
      "Fresh vegetables and fruits",
      "Frozen vegetables and fruits",
      "Dried vegetables and fruits",
      "Fried/Baked vegetables and fruits",
      "Canned/Bottled vegetables and fruits",
      "Whole grains and cereals",
      "Noodles or pasta",
      "Bread and cakes",
      "Biscuits, cookies, or crackers",
      "Chips",
      "Flour",
      "Fresh starchy roots",
      "Dried starchy roots",
      "Fried/Baked starchy roots",
      "Fresh/Frozen meat",
      "Fresh/Frozen poultry",
      "Canned meat or poultry",
      "Canned fish or seafood",
      "Eggs",
      "Dried or canned beans and peas",
      "Nuts and seeds",
    ];

    var categories = rawCategories.map((element) {
      return DropdownMenuItem(
        child: Text(element, style: TextStyle(fontSize: 16)),
        value: element,
      );
    }).toList();

    var subcategories = rawSubcategories.map((element) {
      return DropdownMenuItem(
        child: Text(element, style: TextStyle(fontSize: 16)),
        value: element,
      );
    }).toList();

    _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Color(0xFF3CBA9E),
              accentColor: Color(0xFF67E093),
              colorScheme: ColorScheme.light(primary: const Color(0xFF3CBA9E)),
            ),
            child: child,
          );
        },
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          var date = DateFormat("d MMMM y").format(picked);
          _dateController.text = date;
        });
      }
    }

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
                    title: 'Donation Form',
                    subtitle:
                        'Please input as much information as you can about your donation.',
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Food Category",
                                style: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: DropdownButton(
                                  value: _category,
                                  isExpanded: true,
                                  items: categories,
                                  onChanged: (value) {
                                    setState(() {
                                      _category = value;
                                    });
                                  }),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Food Subcategory",
                                style: TextStyle(
                                    color: dark_grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Container(
                              child: DropdownButton(
                                  value: _subcategory,
                                  isExpanded: true,
                                  items: subcategories,
                                  onChanged: (value) {
                                    setState(() {
                                      _subcategory = value;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        labelText: "Expiration Date",
                                        labelStyle: TextStyle(
                                            color: dark_grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: "Enter the expiration date",
                                        hintStyle:
                                            TextStyle(height: 2, fontSize: 16),
                                        suffixIcon: Icon(
                                          Icons.calendar_today,
                                          color: dark_green,
                                          size: 28,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: dark_green),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return "Please enter a date for your task";
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                TextField(
                                  controller: _addressController,
                                  decoration: InputDecoration(
                                    labelText: "Pick-Up Address",
                                    labelStyle: TextStyle(
                                        color: dark_grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "Enter the pick-up address",
                                    hintStyle:
                                        TextStyle(height: 2, fontSize: 16),
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
                                  controller: _weightController,
                                  decoration: InputDecoration(
                                    labelText: "Estimated Weight",
                                    labelStyle: TextStyle(
                                        color: dark_grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText:
                                        "Enter the estimated weight in kg",
                                    hintStyle:
                                        TextStyle(height: 2, fontSize: 16),
                                    suffixText: 'kg',
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
                                  controller: _notesController,
                                  decoration: InputDecoration(
                                    labelText: "Notes",
                                    labelStyle: TextStyle(
                                        color: dark_grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "Enter additional information...",
                                    hintStyle:
                                        TextStyle(height: 2, fontSize: 16),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: dark_green),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 30),
                        child: (!widget.isUpdating)
                            ? MainButton(
                                press: () {
                                  Database.addDonation({
                                    'category': _category,
                                    'subcategory': _subcategory,
                                    'donorID': widget.uid,
                                    'pantryID': "",
                                    'rescuerID': "",
                                    'expiry': _dateController.text,
                                    'deliverTo': "",
                                    'deliverFrom': _addressController.text,
                                    'estWeight': _weightController.text,
                                    'notes': _notesController.text,
                                    'status': 'pending',
                                  });
                                  Navigator.pop(context);
                                },
                                text: "Post Donation",
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    light_green,
                                    dark_green,
                                  ],
                                ),
                              )
                            : MainButton(
                                press: () {
                                  Database.updateDonation(
                                      widget.donationID,
                                      _category,
                                      _subcategory,
                                      _dateController.text,
                                      _weightController.text,
                                      _addressController.text,
                                      _notesController.text);
                                  Navigator.pop(context);
                                },
                                text: "Save Donation",
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    light_green,
                                    dark_green,
                                  ],
                                ),
                              ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                          child: (widget.isUpdating)
                              ? MainButton(
                                  press: () {
                                    Database.deleteDonation(widget.donationID);
                                    Navigator.pop(context);
                                  },
                                  text: "Delete Donation",
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      light_red,
                                      dark_red,
                                    ],
                                  ),
                                )
                              : Container())
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
