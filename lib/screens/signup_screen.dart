import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bin_buddy/widgets/my_button.dart';
import 'package:bin_buddy/widgets/my_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

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

                Center(
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 12),

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
                  label: "Full Name",
                  underlineColor: underlineGreen,
                ),

                const SizedBox(height: 22),

                // EMAIL
                MyTextFormField(label: "Email", underlineColor: underlineGreen),

                const SizedBox(height: 22),

                // PASSWORD
                MyTextFormField(
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
                MyButton(text: "Sign Up", color: deepGreen, onPressed: () {}),

                const SizedBox(height: 20),

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
