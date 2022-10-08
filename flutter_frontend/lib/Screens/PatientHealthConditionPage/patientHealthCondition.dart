import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:team_bash_project/Widgets/BlackBorderButton.dart';

class PatientHealthCondition extends StatefulWidget {
  const PatientHealthCondition({Key? key}) : super(key: key);

  @override
  State<PatientHealthCondition> createState() => _PatientHealthConditionState();
}

class _PatientHealthConditionState extends State<PatientHealthCondition> {
  bool isFeverPressed = false;
  List<String> _selectedConditions = [];
  List<String> confirmedConditions = [];

  static const sampleImageURL =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lion_d%27Afrique.jpg/1879px-Lion_d%27Afrique.jpg";

  final TextEditingController _othersController = TextEditingController();

  Widget healthConditionRow(String condition) {
    bool isSelected = _selectedConditions.contains(condition);
    IconData checkmarkIcon =
        isSelected ? CupertinoIcons.checkmark_square : CupertinoIcons.square;
    return Container(
      width: 300,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 80,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                if (isSelected) {
                  _selectedConditions.remove(condition);
                } else {
                  _selectedConditions.add(condition);
                }
              });
            },
            child: Icon(
              checkmarkIcon,
              color: Colors.black,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(condition),
        ],
      ),
    );
  }

  // Widget blackBorderButton({
  //   required String buttonText,
  //   required VoidCallback? onPressed,
  //   double? width,
  //   double? height,
  //   EdgeInsets? padding = EdgeInsets.zero,
  // }) {
  //   return CupertinoButton(
  //       padding: EdgeInsets.zero,
  //       onPressed: onPressed,
  //       child: Container(
  //         alignment: Alignment.center,
  //         margin: padding,
  //         width: width ?? double.infinity,
  //         height: height ?? 60,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           border: Border.all(color: Colors.black, width: 2),
  //         ),
  //         child: Text(
  //           buttonText,
  //           style: const TextStyle(
  //             color: Colors.black,
  //             fontWeight: FontWeight.w800,
  //             fontSize: 24,
  //           ),
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Today\'s Health condition ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: CachedNetworkImage(
                imageUrl: sampleImageURL,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            healthConditionRow("Fever"),
            healthConditionRow("Cough"),
            healthConditionRow("Tiredness"),
            healthConditionRow("Sore throat"),
            healthConditionRow("Chest pain"),
            Container(
              width: 300,
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text("Others:"),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _othersController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            BlackBorderButton(
                buttonText: "Confirm",
                onPressed: () {
                  confirmedConditions.clear();
                  confirmedConditions.addAll(_selectedConditions);
                  if (_othersController.text.isNotEmpty) {
                    confirmedConditions.add(_othersController.text);
                  }

                  print(confirmedConditions);
                },
                width: 150,
                height: 50),
            const SizedBox(
              height: 120,
            ),
          ]),
        ),
      ),
    );
  }
}
