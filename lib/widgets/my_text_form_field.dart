import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final Color underlineColor;
  final bool obscureText;
  final bool showToggle;
  final VoidCallback? onToggle;
  final TextEditingController? controller; // <-- Add this

  const MyTextFormField({
    super.key,
    required this.label,
    required this.underlineColor,
    this.obscureText = false,
    this.showToggle = false,
    this.onToggle,
    this.controller, // <-- Add this
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // <-- Add this
      obscureText: obscureText,
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
