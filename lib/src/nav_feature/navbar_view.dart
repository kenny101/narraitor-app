import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:narraitor/src/home_feature/home_view.dart';
import 'package:narraitor/src/library_feature/library_view.dart';
import 'package:narraitor/src/profile_feature/profile_view.dart';
import 'package:narraitor/src/play_feature/play_view.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    PlayView(),
    LibraryView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the screen to black.
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GNav(
              rippleColor: Colors.grey[100]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              tabBorder:
                  Border.all(color: Colors.grey, width: 2), // tab button border
              activeColor: Colors.white, // Set the active tab's color to white.
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(40, 245, 245, 245),
              color: Colors.white, // Set the inactive tabs' color to white.
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.playCircle,
                  text: 'Playing', // Set horizontal margin to zero.
                ),
                GButton(
                  icon: LineIcons.bookReader,
                  text: 'Library',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile', // Set horizontal margin to zero.
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
