import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

class Badge extends StatelessWidget {
  final String number;

  const Badge({
    Key key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
            BoxShadow(
                color: Colors.grey[100],
                blurRadius: 5.0,
                spreadRadius: 5.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
        ],
      ),                    
      padding: const EdgeInsets.all(20),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(this.number, style: TextStyle(color: text_green, fontSize: 27, fontWeight: FontWeight.bold)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text("successful", style: TextStyle(color: text_green, fontSize: 14, fontWeight: FontWeight.bold)),
          Text("donations", style: TextStyle(color: text_green, fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Icon(
            Icons.star,
            color: Colors.green,
            size: 20.0,
          ),
        ],
      )
    );
  }
}

