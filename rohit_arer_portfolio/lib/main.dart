import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rohit_arer_portfolio/screens/home_screen.dart';
import 'package:rohit_arer_portfolio/screens/projects_page.dart';
import 'package:rohit_arer_portfolio/screens/about_me_page.dart';
import 'package:rohit_arer_portfolio/screens/experience_page.dart';
import 'package:rohit_arer_portfolio/constants/app_colors.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    print('run');
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC4ap7elNhA9NCMjKGNSH8q_w327sFXXC8",
            authDomain: "rohit-arer-portfolio.firebaseapp.com",
            projectId: "rohit-arer-portfolio",
            storageBucket: "rohit-arer-portfolio.firebasestorage.app",
            messagingSenderId: "716250822438",
            appId: "1:716250822438:web:d09db1d24a0d7f7e6af3e7",
            measurementId: "G-EY6Z6JKPKT"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Pure white background
          elevation: 0, // Remove elevation shadow
        ),
        useMaterial3: true, // Ensures Material3 behavior (optional)
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: Colors.white, // Disable elevation overlay
        ),
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
