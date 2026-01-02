import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final Color underlineColor;
  final bool obscureText;
  final bool showToggle;
  final VoidCallback? onToggle;
  final TextEditingController? controller;

  // ADD VALIDATOR
  final String? Function(String?)? validator;

  const MyTextFormField({
    super.key,
    required this.label,
    required this.underlineColor,
    this.obscureText = false,
    this.showToggle = false,
    this.onToggle,
    this.controller,
    this.validator, // ADD THIS
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // CHANGED FROM TextField
      controller: controller,
      obscureText: obscureText,
      validator: validator, // PASS VALIDATOR
      style: GoogleFonts.inter(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(color: Colors.black87),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor, width: 2.5),
        ),

        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.5),
        ),

        suffixIcon: showToggle
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: underlineColor,
                ),
                onPressed: onToggle,
              )
            : null,
      ),
    );
  }
}
