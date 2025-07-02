import 'package:flutter/material.dart';
import 'package:nutritrack_test/Navigation/nav_logic.dart';
import 'package:provider/provider.dart';
import 'state/auth_state.dart';
import 'screens/splash_screen.dart'; // Keep this import
import 'screens/auth_wrapper.dart';
import 'screens/signup_page.dart';
import 'Navigation/nav_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => NavState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriTrack Mama',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const SplashScreen(), // SplashScreen as initial route
      debugShowCheckedModeBanner: false,
      routes: {
        '/wrapper': (context) => const AuthWrapper(), // Add this route
        '/home': (context) => MainScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
