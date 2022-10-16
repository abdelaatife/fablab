import 'package:fablab/views/screens/home/home_page.dart';
import 'package:fablab/views/screens/profil_page.dart';
import 'package:fablab/views/screens/register/register.dart';
import 'package:fablab/views/screens/setup/setup_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../core/constant/imageassets.dart';
import '../model/onbordingmodel.dart';

List<BottomNavigationBarItem> bottomBarItems =
    const [
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
  const SetupPage(),
  const AppRegisterPage(),
  const ProfilePage()  
   
];

// onboarding
List<OnbordingModel> onBordingList = [
  OnbordingModel(
      title: 'Welcome to FabLab',
      description: 'FabLab is a laboratory that allows you to create your own project.',
      imageUrl: AppImageUrl.onbordingone),
  OnbordingModel(
      title: 'Materials',
      description: 'Explore the materials available in the FabLab to start your project.',
      imageUrl: AppImageUrl.onbordingtwo),
  OnbordingModel(
      title: 'Register',
      description: "You can register in the FabLab from the application." ,
      imageUrl: AppImageUrl.onbordingthree),
  
];
