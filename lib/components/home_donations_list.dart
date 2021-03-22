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
                    SizedBox(height: 10.0),
                    DonationDetailItem(Icons.warning, "Expiration Date",
                        DateFormat("d MMMM y").format(cardData[4]), true),
                    SizedBox(height: 5.0),
                    DonationDetailItem(
                        Icons.location_on, "Address", cardData[5], false),
                    SizedBox(height: 5.0),
                    DonationDetailItem(
                        // TODO: Change this icon too.
                        Icons.attach_money,
                        "Estimated Weight",
                        cardData[6].toString() + " kg",
                        false),
                    SizedBox(height: 5.0),
                    DonationDetailItem(
                        // TODO: Change this icon too.
                        Icons.note,
                        "Notes",
                        "",
                        false),
                    Text(cardData[7], style: style_donation_notes),
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

class DonationDetailItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String content;
  final bool is_expiry;

  DonationDetailItem(this.icon, this.text, this.content, this.is_expiry);

  @override
  Widget build(BuildContext context) {
    var style_text =
        (is_expiry) ? style_donation_detail_expiry : style_donation_detail_text;
    var style_content = (is_expiry)
        ? style_donation_detail_expiry
        : style_donation_detail_content;

    var iconWidget =
        (is_expiry) ? Icon(icon, color: text_red) : GradientIcon(icon);

    return Align(
        alignment: Alignment.centerLeft,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            iconWidget,
            SizedBox(width: 5),
            Text(
              text,
              style: style_text,
            )
          ]),
          Text(
            content,
            style: style_content,
          )
        ]));
  }
}
