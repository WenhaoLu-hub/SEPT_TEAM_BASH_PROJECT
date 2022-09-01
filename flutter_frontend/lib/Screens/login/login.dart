// ignore_for_file: sized_box_for_whitespace


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _logo(context),
        const SizedBox(height: 30,),
        _loginLabel(),
      ],
    ));
  }
}

Widget _loginLabel(){
  return Center(
    child: Text("Login",
    style: GoogleFonts.josefinSans(
      textStyle: const TextStyle(
        color: Color(0xff164276),
        fontWeight: FontWeight.w900,
        fontSize: 34,
      )
    ),),
  );
}

Widget _logo(BuildContext context){
  Size size = MediaQuery.of(context).size;

  return Center(
    child: SizedBox(
      child: Image(
              width: size.width * 0.25,
              image: const AssetImage('assets/images/logo.png'),
            ),
    ),
  );
}


class TextFieldContainer extends StatelessWidget {
  final Widget child;
   // ignore: use_key_in_widget_constructors
   const TextFieldContainer({

    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),
        child: child);
  }
}
