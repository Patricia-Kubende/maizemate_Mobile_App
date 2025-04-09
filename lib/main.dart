import 'package:flutter/material.dart';
import 'dashboard_screen.dart';  // Import the dashboard file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maize Yield Prediction',
      theme: ThemeData(
        primaryColor: const Color(0xFF2E7D32),
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
      ),
      home: const DashboardScreen(),  // Use the DashboardScreen here
    );
  }
}
