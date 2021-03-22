import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';
import 'package:foodboard/components/gradient_icon.dart';

import 'package:intl/intl.dart';

class HomeDonationsList extends StatelessWidget {
  final donations;

  HomeDonationsList(this.donations);

  @override
  Widget build(BuildContext context) {
    var donationsCards = <Widget>[];
    donations.forEach((element) => donationsCards.add(DonationCard(element)));

    return Container(
        constraints: BoxConstraints.expand(),
        color: cards_background_color,
        child: ListView(
          children: donationsCards,
        ));
  }
}

class DonationCard extends StatelessWidget {
  final cardData;

  DonationCard(this.cardData);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(4, 0),
              color: shadow_color,
              spreadRadius: -13.0,
              blurRadius: 8.0)
        ]),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Donation #" + cardData[0].toString(),
                          style: style_donation_no,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cardData[1],
                          style: style_donation_name,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cardData[2],
                          style: style_donation_address,
                        )),
                    SizedBox(height: 10.0),
                    DonationCardFoodTags(cardData[3]),
                  ],
                ))));
  }
}

class DonationCardFoodTags extends StatelessWidget {
  final tags;

  DonationCardFoodTags(this.tags);

  @override
  Widget build(BuildContext context) {
    var foodTags = <Widget>[];
    tags.forEach((element) => foodTags.add(Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: text_green,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          element,
          style: style_donation_food_tag,
        ))));

    return Row(
      children: foodTags,
    );
  }
}
