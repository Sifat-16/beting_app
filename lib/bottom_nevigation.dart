
import 'package:beting_app/sceens/nevigation%20screens/help_screens.dart';
import 'package:beting_app/sceens/nevigation%20screens/home_page.dart';
import 'package:beting_app/sceens/nevigation%20screens/profile_screens.dart';
import 'package:beting_app/sceens/nevigation%20screens/rules_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Helper/style.dart';

class NavegationBar extends StatefulWidget {
  const NavegationBar({Key? key}) : super(key: key);

  @override
  State<NavegationBar> createState() => _NavegationBarState();
}


class _NavegationBarState extends State<NavegationBar> {


  int selectedindex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screen = [
    HomePage(),
    HelpScreen(),
    RulesScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30,),
          Icon(Icons.rule, size: 30),
          Icon(Icons.question_answer, size: 30),
          Icon(Icons.person, size: 30),
          
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Style.backgroundColor3,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screen[selectedindex]);
      }
}

