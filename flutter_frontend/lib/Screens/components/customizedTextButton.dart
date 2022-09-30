import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedTextButton extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight fontWeight;
  final VoidCallback press;
  final double fontSize;

  const CustomizedTextButton(
      {super.key,
      required this.label,
      required this.press,
      required this.color,
      required this.fontWeight,
      required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        label,
        style: GoogleFonts.josefinSans(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}