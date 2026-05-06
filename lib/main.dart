import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/kelas_screen.dart'; // Tambahin ini
import 'screens/profile_screen.dart'; // Tambahin ini

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/kelas': (context) => const KelasScreen(), // Tambahin ini
        '/profile': (context) => const ProfileScreen(), // Tambahin ini
      },
    );
  }
}

