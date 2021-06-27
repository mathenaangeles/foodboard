import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final int tab;
  final String userType;

  const Profile({Key key, this.tab, this.userType}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}