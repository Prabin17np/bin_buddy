import 'package:bin_buddy/features/auth/presentation/state/auth_state.dart';
import 'package:bin_buddy/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bin_buddy/widgets/my_button.dart';
import 'package:bin_buddy/widgets/my_text_form_field.dart';
import 'package:bin_buddy/features/auth/presentation/pages/signup_page.dart';
import 'package:bin_buddy/features/dashboard/presentation/pages/bottom_navigation_page.dart';
import 'package:bin_buddy/common/snackbar_helper.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;

  final Color background = const Color(0xFFFCEEEE);
  final Color deepGreen = const Color(0xFF1F5E24);
  final Color underlineGreen = const Color(0xFF2F7330);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      //  Replace with real auth logic later
      ref
          .read(authViewModelProvider.notifier)
          .login(
            email: _emailController.text,
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authViewModelProvider, (previous, next) {
      if (next.status == AuthStatus.error) {
        showMySnackBar(
          context: context,
          message: next.errorMessage ?? "Login Failed",
          backgroundColor: Colors.redAccent,
        );
      } else if (next.status == AuthStatus.authenticated) {
        showMySnackBar(
          context: context,
          message: "Login Successfull",
          backgroundColor: Colors.green.shade900,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BottomNavigationScreen()),
        );
      }
    });

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Image.asset(
                  'assets/images/logo.jpg',
                  height: 170,
                  fit: BoxFit.contain,
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

                /// EMAIL
                MyTextFormField(
                  controller: _emailController,
                  label: "Email",
                  underlineColor: underlineGreen,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 22),

                /// PASSWORD
                MyTextFormField(
                  controller: _passwordController,
                  label: "Password",
                  underlineColor: underlineGreen,
                  obscureText: !_passwordVisible,
                  showToggle: true,
                  onToggle: () {
                    setState(() => _passwordVisible = !_passwordVisible);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 28),

                /// LOGIN BUTTON
                MyButton(
                  text: "Login",
                  color: deepGreen,
                  onPressed: _handleLogin,
                ),

                const SizedBox(height: 20),

                /// SIGN UP
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
                        " Register now",
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
