import 'dart:async'; // Needed for the Timer
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Makes the loader spin forever

    // Simulate loading for 3 seconds, then (later) navigate to next page
    Timer(const Duration(seconds: 3), () {
      // Example: You can add navigation here later
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2C30), // Dark background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo text (VANture)
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'VAN',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFD69C39),
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: 'TURE',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFD69C39),
                      fontWeight: FontWeight.normal,
                      fontSize: 32,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 180), // Space between logo and loader
            // The loading circle
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 6.3, // Spins the loader
                  child: child,
                );
              },
              child: SizedBox(
                width: 54,
                height: 54,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFD69C39)),
                  backgroundColor: const Color(0xFF212227),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
