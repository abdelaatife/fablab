import 'package:fablab/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

List<BottomNavigationBarItem> bottomBarItems = const [
  BottomNavigationBarItem(
    icon: Icon(Ionicons.home_outline),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Ionicons.flask_outline),
    label: 'Setup',
  ),
  BottomNavigationBarItem(
    icon: Icon(Ionicons.reader_outline),
    label: 'Register',
  ),
  BottomNavigationBarItem(
    icon: Icon(Ionicons.person_outline),
    label: 'me',
  ),
];

List<Widget> widgetOptions = <Widget>[
  const HomePage(),
  const Text(
    'Index 2: Business',
  ),
  const Text(
    'Index 2: Business',
  ),
  const Text(
    'Index 3: Settings',
  ),
];
