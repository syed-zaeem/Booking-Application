import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.grey[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text(' '),
  centerTitle: false,
);
var drawerTextColor = TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
);

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

var darkBlue = Color.fromARGB(255, 255, 255, 255);
var drawerBackgroundColor = darkBlue;

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  IconData selectedIcon = Icons.home;
  bool isHovered = false;

  void handleHover(bool isHovering) {
    setState(() {
      isHovered = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: drawerBackgroundColor,
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: appBarColor,
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&q=80&w=1740&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Booking App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: MouseRegion(
                onEnter: (_) {
                  handleHover(true);
                },
                onExit: (_) {
                  handleHover(false);
                },
                child: Icon(
                  Icons.home,
                  color: selectedIcon == Icons.home || isHovered ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              title: Text(
                'DASHBOARD',
                style: drawerTextColor,
              ),
              onTap: () {
                setState(() {
                  selectedIcon = Icons.home;
                });
              },
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: MouseRegion(
                onEnter: (_) {
                  handleHover(true);
                },
                onExit: (_) {
                  handleHover(false);
                },
                child: Icon(
                  Icons.settings,
                  color: selectedIcon == Icons.settings || isHovered ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              title: Text(
                'SETTINGS',
                style: drawerTextColor,
              ),
              onTap: () {
                setState(() {
                  selectedIcon = Icons.settings;
                });
              },
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: MouseRegion(
                onEnter: (_) {
                  handleHover(true);
                },
                onExit: (_) {
                  handleHover(false);
                },
                child: Icon(
                  Icons.info,
                  color: selectedIcon == Icons.info || isHovered ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              title: Text(
                'ABOUT',
                style: drawerTextColor,
              ),
              onTap: () {
                setState(() {
                  selectedIcon = Icons.info;
                });
              },
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: MouseRegion(
                onEnter: (_) {
                  handleHover(true);
                },
                onExit: (_) {
                  handleHover(false);
                },
                child: Icon(
                  Icons.logout,
                  color: selectedIcon == Icons.logout || isHovered ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              title: Text(
                'LOGOUT',
                style: drawerTextColor,
              ),
              onTap: () {
                setState(() {
                  selectedIcon = Icons.logout;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


