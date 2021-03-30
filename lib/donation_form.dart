import 'package:flutter/gestures.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/database.dart';
import 'package:flutter/material.dart';

import 'package:foodboard/components/main_button.dart';
import 'package:foodboard/components/forms_header.dart';

import 'constants.dart';

class DonationForm extends StatefulWidget {
  final uid;

  DonationForm(this.uid);

  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  // TODO: Change this later
  // Let's use a string value for now
  // int _value = 1;

  String _category = "Select food category";
  String _subcategory = "Select food subcategory";

  @override
  Widget build(BuildContext context) {
    var rawCategories = [
      "Select food category",
      "Vegetables and fruits",
      "Grain",
      "Starchy roots",
      "Meat",
      "Dairy",
      "Other beverages",
    ];
    var rawSubcategories = [
      "Select food subcategory",
      "Fresh vegetable and fruit",
      "Frozen vegetable and fruit",
      "Dried vegetable and fruit",
      "Fried/Baked vegetable and fruit",
      "Canned/Bottled vegetable and fruit",
      "Whole grains, cereals and products",
      "Noodles or pasta",
      "Hot or cold cereals",
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
    ]; // TODO: Just expand this list

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
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          var date =
              "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
          _dateController.text = date;
        });
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
                                "Food Subcategory Name",
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
                                        labelText: "Date",
                                        labelStyle: TextStyle(
                                            color: dark_grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText:
                                            "Enter your address for pick up",
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
                                    labelText: "Address",
                                    labelStyle: TextStyle(
                                        color: dark_grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: "Enter your address for pick up",
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
                        child: MainButton(
                          press: () {
                            Database.addDonation({
                              'name': _category,
                              'subcat': _subcategory,
                              // For now, let's use the category as the title
                              'category': _category,
                              'subcategory': _subcategory,
                              'donorID': widget.uid,
                              'pantryID': "",
                              'rescuerID': "",
                              'expiry': _expiryController.text,
                              'deliverTo': _addressController.text,
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
