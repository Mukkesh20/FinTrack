import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

const kCardHeadingTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'fonts',
  fontWeight: FontWeight.bold,
  fontSize: 35.0,
  shadows: [
    Shadow(
      blurRadius: 1.0,
      color: Colors.blue,
      offset: Offset(1.0, 1.0),
    ),
  ],
);

AppBar kAppBar = AppBar(
  leading: Icon(Icons.menu),
  title: Text('Page title'),
  actions: [
    Icon(Icons.favorite),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.search),
    ),
    Icon(Icons.more_vert),
  ],
);

ConvexAppBar kBottomNavyBar = ConvexAppBar(
  items: [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.map, title: 'Discovery'),
    TabItem(icon: Icons.add, title: 'Add'),
    TabItem(icon: Icons.message, title: 'Message'),
    TabItem(icon: Icons.people, title: 'Profile'),
  ],
  initialActiveIndex: 2, //optional, default as 0
  onTap: (int i) => print('click index=$i'),
);
