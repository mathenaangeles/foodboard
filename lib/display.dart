import 'package:flutter/material.dart';

import 'constants.dart';
import 'home.dart';
import 'screens/map.dart';
import 'screens/profile.dart';


class Display extends StatefulWidget {
  final int tab;
  final String userType;

  const Display({Key key, this.tab, this.userType}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}
class _DisplayState extends State<Display> {
  List<Widget> _widgetDisplay() => <Widget>[
      Home(widget.userType),
      Map(),
      Profile(widget.userType)
  ];
  
  int currentTab = 0;
  var start = 0;
  
  @override
  Widget build(BuildContext context) {
    if (start == 0){
      currentTab = widget.tab;
      start = 1;
    }

    final List<Widget> widgetDisplay = _widgetDisplay();
    
    return Scaffold(
      body: widgetDisplay[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:light_green,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        currentIndex: currentTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25.0,
            ),
            label: 'Home',
            backgroundColor: light_green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                  Icons.map_outlined,
                  color: Colors.white,
                  size: 25.0,
            ),
            label: 'Maps',
            backgroundColor: light_green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 25.0,
            ),
            label: 'Profile',
            backgroundColor: light_green,
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}