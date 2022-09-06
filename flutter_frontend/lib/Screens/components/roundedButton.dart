// ignore: file_names
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  // ignore: use_key_in_widget_constructors
  const RoundedButton({
    required this.text,
    required this.press});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) =>
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 16)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29.0),
          )),
        ),
        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
