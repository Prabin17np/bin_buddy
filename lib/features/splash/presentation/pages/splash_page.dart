import 'dart:async';
import 'package:bin_buddy/core/services/storage/user_session_service.dart';
import 'package:bin_buddy/features/dashboard/presentation/pages/bottom_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:bin_buddy/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// <-- onboarding Screen import

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    // Note: Check if the user is already logged in
    final userSessionService = ref.read(userSessionServiceProvider);
    final isLoggedIn = userSessionService.isLoggedIn();

    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Logo
              Image.asset(
                "assets/images/logo.jpg", // <-- Your logo
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.contain,
              ),

              // App Title
              const Text(
                "Buddy App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
