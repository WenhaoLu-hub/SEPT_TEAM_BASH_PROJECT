import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PatientHealthCondition extends StatefulWidget {
  const PatientHealthCondition({Key? key}) : super(key: key);

  @override
  State<PatientHealthCondition> createState() => _PatientHealthConditionState();
}

class _PatientHealthConditionState extends State<PatientHealthCondition> {
  bool isFeverPressed = false;
  List<String> _selectedConditions = [];

  Widget healthConditionRow(String condition, bool isSelected) {
    bool isSelected = isFeverPressed;
    IconData checkmarkIcon =
        isSelected ? CupertinoIcons.checkmark_square : CupertinoIcons.square;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              isFeverPressed = !isFeverPressed;
            });

            print(isFeverPressed);
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(children: [
          healthConditionRow("Fever"),
          healthConditionRow("Cough"),
          healthConditionRow("Tiredness"),
          healthConditionRow("Sore throat"),
          healthConditionRow("Chest pain"),
        ]),
      ),
    );
  }
}
