import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/in_memory_store.dart';
import 'utils/theme.dart'; // ✅ Add this line
import 'package:provider/provider.dart';

void main() {
  runApp(AidConnectApp());
}

class AidConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InMemoryStore(),
      child: MaterialApp(
        title: 'AidConnect',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme, // ✅ Now recognized
        home: LoginScreen(),
        routes: {
          '/home': (_) => HomeScreen(),
        },
      ),
    );
  }
}
