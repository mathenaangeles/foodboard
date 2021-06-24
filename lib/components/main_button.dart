import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function press;
  final Gradient gradient;
  const MainButton({
    Key key,
    this.text,
    this.press,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: press,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), gradient: gradient),
          child: Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

class MainIconButton extends StatelessWidget {
  final IconData icon;
  final Function press;
  final Gradient gradient;
  const MainIconButton({
    Key key,
    this.icon,
    this.press,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: press,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), gradient: gradient),
          child: Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class MainTextButton extends StatelessWidget {
  final String text;
  final Function press;
  final Gradient gradient;
  const MainTextButton({
    Key key,
    this.text,
    this.press,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: press,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), gradient: gradient),
          child: Container(
            constraints: BoxConstraints.expand(),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
