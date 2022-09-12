import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  final _usernameController = TextEditingController();
  bool _submitted = false;

  void _submit() {
    setState(() => _submitted = true);
    // if there is no error text
    if (_errorText == null) {
      // notify the parent widget via the onSubmit callback
      widget.onSubmit(_usernameController.value.text);
    }
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _usernameController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'username nan\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _usernameController,
      builder: (context, TextEditingValue value, __) {
        return Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username",
                style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Color(0xff293462),
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
              ),
              TextField(
                controller: _usernameController,
                onChanged: (_) => setState(() {} ),
                obscureText: false,
                cursorColor: const Color.fromARGB(255, 100, 94, 94),
                decoration: InputDecoration(
                    hintText: "yourname",
                    errorText: _submitted ? _errorText : null,
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
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Color(0xff293462),
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
              ),
              TextField(
                obscureText: true,
                cursorColor: const Color.fromARGB(255, 100, 94, 94),
                decoration: InputDecoration(
                    hintText: "Your password",
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
          ),
          const SizedBox(
            height: 60,
          ),
          // _loginBtn(),
          Container(
              width: double.infinity,
              height: 60,
              decoration: const BoxDecoration(
                  color: Color(0xff008fff),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextButton(
                onPressed:
                    _usernameController.value.text.isNotEmpty ? _submit : null,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
              ))
        ],
      );
      }
      // this entire widget tree will rebuild every time
      // the controller value changes

    );
  }
}

