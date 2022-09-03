import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/components/roundedButton.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({Key? key}) : super(key: key);
  static const sampleImageURL =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lion_d%27Afrique.jpg/1879px-Lion_d%27Afrique.jpg";

  final sampleName = "Jadon";
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: deviceSize.width,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: CachedNetworkImage(
                  imageUrl: sampleImageURL,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                'Hi, $sampleName',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
                textAlign: TextAlign.center,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                  size: 36,
                ),
                onPressed: () {
                  print("Message bubble pressed");
                },
              ),
            ],
          ),
          const SizedBox(
            height: 64,
          ),
          _button(buttonText: "Today's health condition"),
          _button(buttonText: "Book an Appointment"),
          _button(buttonText: "My Appointment"),
          _button(buttonText: "My Record"),
          _button(buttonText: "My Prescription"),
        ]),
      ),
    );
  }

  Widget _button({required String buttonText, VoidCallback? onPressed}) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 40),
        height: 60,
        decoration: const BoxDecoration(
            color: Color(0xff008fff),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
        ));
  }
}
