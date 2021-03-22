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
    for (var i = 0; i < 50; i++) {
      donationsCards.add(Text(i.toString()));
    }

    return Container(
        constraints: BoxConstraints.expand(),
        color: cards_background_color,
        child: ListView(
          children: donationsCards,
        ));
  }
}
