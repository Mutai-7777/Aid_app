import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aidconnect_app/screens/login_screen.dart';
import 'package:aidconnect_app/screens/home_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // User logged in → Go to Home
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // User NOT logged in → Login page
        return const LoginScreen();
      },
    );
  }
}
