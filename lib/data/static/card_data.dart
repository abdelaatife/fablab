// static data for cards

import 'package:fablab/views/screens/register/supervisiorslist.dart';
import 'package:fablab/views/screens/register/teacher_form_page.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/screens/register/student_form_page.dart';
import '../model/cart_model.dart';

const String path = 'assets/images/';
List<CardModel> cardData = [
  CardModel(
    titel: 'Student',
    description: "Register as a student",
    image: '${path}student.png',
    color: const Color(0xFFFFDCD7),
    onTap: () => Get.to(() => const StudentForm(),
        transition: Transition.zoom,
        arguments: [
          {
            'title': 'Student',
            'description': 'Register as a student',
            'image': '${path}student.png',
            'color': const Color(0xFFFFDCD7),
          }
        ],
        duration:
            const Duration(milliseconds: 250)),
  ),
  CardModel(
    titel: 'Teacher',
    description: "Register as a teacher",
    image: '${path}Math.png',
    color: const Color(0xFFCFC0E9),
    
    onTap: () =>  Get.to(() => const TeacherForm(),
        transition: Transition.zoom,
        arguments: [
          {
            'title': 'Teacher',
            'description': 'Register as a teacher',
            'image': '${path}Math.png',
            'color': const Color(0xFFCFC0E9),
          }
        ],
        duration:
            const Duration(milliseconds: 250)),
  ),
  CardModel(
    titel: 'Supervisiors',
    description: "Select a Supervisiors",
    image: '${path}Internship.png',
    color: const Color(0xFFE4F8EA),
    onTap: ()  => Get.to(() => const SupervisiorsPage(),
        transition: Transition.zoom,
        arguments: [
          {
            'title': 'Supervisiors',
            'description': 'List of Supervisiors',
            'image': '${path}Internship.png',
            'color': const Color(0xFFE4F8EA),
          }
        ],
        duration:
            const Duration(milliseconds: 250)),
  ),
  CardModel(
    titel: 'Personnel',
    description: "Your personnel Data",
    image: '${path}personal.png',
    color: const Color(0xFFE4F2FE),
    onTap: () {},
  ),
];
