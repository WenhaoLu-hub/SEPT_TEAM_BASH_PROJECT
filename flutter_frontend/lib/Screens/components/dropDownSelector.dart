

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownSelector extends StatefulWidget {
  final String? Function(String?)? validator;
  final String title;
  String? selectValue;
  final String defaultValue;
  final List<String> dropdownList;
  DropDownSelector({
    Key? key,
    required this.validator,
    required this.title,
    required this.defaultValue,
    required this.dropdownList,
    required this.selectValue,
  }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return DropDownState();
  }
}

class DropDownState extends State<DropDownSelector> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                  color: Color(0xff293462),
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          child: DropdownButtonFormField(
            validator: widget.validator,
            decoration: const InputDecoration(
                enabled: true,
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xffdfe8f3),
                ))),
            isExpanded: true,
            hint: Text(widget.defaultValue),
            value: widget.selectValue,
            style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            items: widget.dropdownList
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                widget.selectValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
