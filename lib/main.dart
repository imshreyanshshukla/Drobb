import 'package:drobb/Screens/gender.dart';
import 'package:drobb/Screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase if not already initialized
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  // Check if it's the first time the app is launched
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  // If it's the first time, set the flag to false
  if (isFirstLaunch) {
    await prefs.setBool('isFirstLaunch', false);
  }

  runApp(MyApp(isFirstLaunch: isFirstLaunch));
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;

  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isFirstLaunch ? SelectionPage() : SwipeableProductScreen(),
    );
  }
}
