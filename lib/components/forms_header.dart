import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function press;
  const FormHeader({
      Key key,
      this.title,
      this.subtitle,
      this.press
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 28),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_backspace, color: Colors.white,
                  size: 40.0,),
                  onPressed: press
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Text(
                  title, 
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)
                ), 
              ],
            ),
          ), 
          Padding(
            padding: const EdgeInsets.only(left: 90.0, right: 40),
            child: Text(
              subtitle, 
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)
            ),
          )
        ]
      )       
    );
  }
}