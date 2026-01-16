import 'package:bin_buddy/features/auth/presentation/state/auth_state.dart';
import 'package:bin_buddy/features/auth/presentation/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bin_buddy/widgets/my_button.dart';
import 'package:bin_buddy/widgets/my_text_form_field.dart';
import 'package:bin_buddy/common/snackbar_helper.dart';
import 'package:bin_buddy/features/auth/presentation/pages/login_page.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final Color background = const Color(0xFFFCEEEE);
  final Color deepGreen = const Color(0xFF1F5E24);
  final Color underlineGreen = const Color(0xFF2F7330);

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      // if (_passwordController.text != _confirmPasswordController.text) {
      //   showMySnackBar(
      //     context: context,
      //     message: "Passwords do not match",
      //     backgroundColor: Colors.red,
      //   );
      // }

      ref
          .read(authViewModelProvider.notifier)
          .register(
            fullName: _fullNameController.text,
            username: _emailController.text.trim().split("@").first,
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
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
      } else if (next.status == AuthStatus.register) {
        showMySnackBar(
          context: context,
          message: "Login Successfull",
          backgroundColor: Colors.green.shade900,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
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
                  controller: _fullNameController,
                  label: "Full Name",
                  underlineColor: underlineGreen,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full name is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 22),

                // EMAIL
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

                // PASSWORD
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
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 22),

                // CONFIRM PASSWORD
                MyTextFormField(
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  underlineColor: underlineGreen,
                  obscureText: !_confirmPasswordVisible,
                  showToggle: true,
                  onToggle: () {
                    setState(
                      () => _confirmPasswordVisible = !_confirmPasswordVisible,
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm your password";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 28),

                MyButton(
                  text: "Sign Up",
                  color: deepGreen,
                  onPressed: _handleSignup,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        " Login",
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
