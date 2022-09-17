// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldContainer extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final void Function(String) onChanged;
  // ignore: use_key_in_widget_constructors
  const TextFieldContainer({
    required this.title,
    required this.hintText,
    required this.isPassword,
    required this.validator,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                  color: Color(0xff293462),
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        TextFormField(
          obscureText: isPassword,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          cursorColor: const Color.fromARGB(255, 100, 94, 94),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Color(0xffc5d2e1),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffdfe8f3)),
              )),
        )
      ],
    );
  }
}
