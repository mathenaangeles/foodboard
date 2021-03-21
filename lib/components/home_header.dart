import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

import 'package:intl/intl.dart';

class HomeHeader extends StatelessWidget {
  final user;
  final String dateNow = DateFormat("EEEE, d MMMM y").format(DateTime.now());

  HomeHeader(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            HeaderTitle(dateNow),
            SizedBox(height: 10),
            HeaderItem(Icons.email_rounded, user.email),
            Divider(color: header_item_color),
            HeaderItem(Icons.local_phone, "+63 (917) 000 0000"),

            SizedBox(height: 20),
            HeaderTitle("Statistics"),
            SizedBox(height: 10),
            // TODO: I can't find the specific icon for this, just change:
            HeaderItemWithContent(
                Icons.set_meal, "Successful Donations", "250"),
          ],
        ));
  }
}

class HeaderTitle extends StatelessWidget {
  final String text;

  HeaderTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              color: header_title_color,
              fontSize: header_text_size,
              fontWeight: FontWeight.w600),
        ));
  }
}

class HeaderItem extends StatelessWidget {
  final IconData icon;
  final String text;

  HeaderItem(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Row(children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
                color: header_item_color,
                fontSize: header_text_size,
                fontWeight: FontWeight.w600),
          )
        ]));
  }
}

class HeaderItemWithContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final String content;

  HeaderItemWithContent(this.icon, this.text, this.content);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                  color: header_item_color,
                  fontSize: header_text_size,
                  fontWeight: FontWeight.w600),
            )
          ]),
          Text(
            content,
            style: TextStyle(
                color: header_title_color,
                fontSize: header_text_size,
                fontWeight: FontWeight.w600),
          )
        ]));
  }
}
