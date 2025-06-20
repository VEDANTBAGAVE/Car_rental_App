import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart'; // <-- Use the home page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vanture Car Rental',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFFD69C39),
        scaffoldBackgroundColor: const Color(0xFF2D2C30),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD69C39),
        ),
      ),
      home: const HomePage(), // <<-- Show home page
      debugShowCheckedModeBanner: false,
    );
  }
}
