import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlackBorderButton extends StatelessWidget {
  // Widget blackBorderButton({
  //   required String buttonText,
  //   required VoidCallback? onPressed,
  //   double? width,
  //   double? height,
  //   EdgeInsets? padding = EdgeInsets.zero,
  // }) {

  final String buttonText;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const BlackBorderButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          margin: padding,
          width: width ?? double.infinity,
          height: height ?? 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ));
  }
}
