import 'package:fablab/views/screens/dashboard.dart';
import 'package:fablab/views/screens/onbording.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebasePerformance.instance
      .newTrace('main_trace');
  FirebaseCrashlytics.instance
      .checkForUnsentReports();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FABLAB',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: FirebaseAuth.instance.currentUser ==
              null
          ? const Onbording()
          : const Dashboard(),
    );
  }
}
