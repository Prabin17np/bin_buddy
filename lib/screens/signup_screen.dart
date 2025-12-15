import 'package:bin_buddy/screens/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bin_buddy/widgets/my_button.dart';
import 'package:bin_buddy/widgets/my_text_form_field.dart';
import 'package:bin_buddy/common/snackbar_helper.dart'; // <-- Your snackbar file

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  // Controllers for each input field
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Color background = const Color(0xFFFCEEEE);
  final Color deepGreen = const Color(0xFF1F5E24);
  final Color underlineGreen = const Color(0xFF2F7330);

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 28;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 12),

                // Title
                Text(
                  'Create Account',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: underlineGreen,
                  ),
                ),

                const SizedBox(height: 28),

                // FULL NAME
                MyTextFormField(
                  controller: fullNameController,
                  label: "Full Name",
                  underlineColor: underlineGreen,
                ),

                const SizedBox(height: 22),

                // EMAIL
                MyTextFormField(
                  controller: emailController,
                  label: "Email",
                  underlineColor: underlineGreen,
                ),

                const SizedBox(height: 22),

                // PASSWORD
                MyTextFormField(
                  controller: passwordController,
                  label: "Password",
                  underlineColor: underlineGreen,
                  obscureText: !passwordVisible,
                  showToggle: true,
                  onToggle: () {
                    setState(() => passwordVisible = !passwordVisible);
                  },
                ),

                const SizedBox(height: 22),

                // CONFIRM PASSWORD
                MyTextFormField(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  underlineColor: underlineGreen,
                  obscureText: !confirmPasswordVisible,
                  showToggle: true,
                  onToggle: () {
                    setState(
                      () => confirmPasswordVisible = !confirmPasswordVisible,
                    );
                  },
                ),

                const SizedBox(height: 28),

                // SIGN UP BUTTON
                MyButton(
                  text: "Sign Up",
                  color: deepGreen,
                  onPressed: () {
                    // Validation
                    if (fullNameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      showMySnackBar(
                        context: context,
                        message: "Please fill in all fields",
                        backgroundColor: Colors.red,
                      );
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      showMySnackBar(
                        context: context,
                        message: "Passwords do not match",
                        backgroundColor: Colors.red,
                      );
                    } else {
                      // Success
                      showMySnackBar(
                        context: context,
                        message: "Signup Successful",
                        backgroundColor: Colors.green,
                      );

                      // Navigate to HomeScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNavigationScreen(),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),

                // Already have account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        ' Login',
                        style: GoogleFonts.inter(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
