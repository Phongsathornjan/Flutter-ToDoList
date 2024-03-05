import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/signin_screen.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onboarding_screen/firebase_options.dart';

bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform); //รอจนเชื่อมต่อ firebase ให้เรียบร้อย
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding_Screen',
      theme: ThemeData(primaryColor: Colors.blue),
      //  home: IntroScreen(),
      home: show ? IntroScreen() : const HomeScreen(),
    );
  }
}
