import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bin_buddy/widgets/my_button.dart';
import 'package:bin_buddy/widgets/my_text_form_field.dart';
import 'package:bin_buddy/screens/signup_screen.dart';
import 'package:bin_buddy/screens/home_screen.dart';
import 'package:bin_buddy/common/snackbar_helper.dart'; // <-- Your snackbar file

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  'Login Now',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: underlineGreen,
                  ),
                ),

                const SizedBox(height: 28),

                // EMAIL FIELD
                MyTextFormField(label: "Email", underlineColor: underlineGreen),

                const SizedBox(height: 22),

                // PASSWORD FIELD
                MyTextFormField(
                  label: "Password",
                  underlineColor: underlineGreen,
                  obscureText: !passwordVisible,
                  showToggle: true,
                  onToggle: () {
                    setState(() => passwordVisible = !passwordVisible);
                  },
                ),

                const SizedBox(height: 28),

                // LOGIN BUTTON
                MyButton(
                  text: "Login",
                  color: deepGreen,
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      showMySnackBar(
                        context: context,
                        message: "Please fill in all fields",
                        backgroundColor: Colors.red,
                      );
                    } else {
                      showMySnackBar(
                        context: context,
                        message: "Login Successful",
                        backgroundColor: Colors.green,
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        ' Register now',
                        style: GoogleFonts.inter(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
