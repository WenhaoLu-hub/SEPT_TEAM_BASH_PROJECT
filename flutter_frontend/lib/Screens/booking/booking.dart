import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:team_bash_project/Screens/booking/controller/booking_controller.dart';
import 'package:team_bash_project/Screens/components/dropDownSelector.dart';
import 'package:team_bash_project/Screens/components/roundedButton.dart';

import '../signup/signUpForm.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

String? _doctorDropdownValue;
String? _timeDropdownValue;
String? _optionDropdownValue;

class _BookingState extends State<Booking> {
  final _formKey = GlobalKey<FormState>();

  var mode = <String>["face to face", "online"];
  String _selectedDate = '';
  final bookingController = Get.put(BookingController());
  void _submit() {
    if (_formKey.currentState!.validate()) {
      print("press the button");
      bookingController.optionEditingController.text = _optionDropdownValue!;
      bookingController.dateEditingController.text = _selectedDate;
      _formKey.currentState!.save();
      bookingController.booking();
    }
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        final now = DateTime.now();
        String formattedTime = DateFormat('HH:mm:ss').format(now);
        _selectedDate =
            DateFormat('yyyy-MM-dd').format(args.value) + " " + formattedTime;
        print("formatted time : ${_selectedDate}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      BackButton(
                        onPressed: (() => Get.back()),
                      ),
                      _title(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SfDateRangePicker(
                    showNavigationArrow: true,
                    enablePastDates: false,
                    initialSelectedDate: DateTime.now(),
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownSelector(
                      title: "meeting option",
                      defaultValue: "choose online or in person",
                      dropdownList: mode,
                      validator: (value) =>
                          value == null ? "option can not be empty" : null,
                      selectValue: _optionDropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          value == null ? null : _optionDropdownValue = value;
                          print("dropdown value : ${value}");
                          print("changed value $_optionDropdownValue");
                        });
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  RoundedButton(
                    text: "Submit",
                    press: () {
                      _submit();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _title() {
  return Center(
    child: Text(
      "Booking",
      style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
        color: Color(0xff164276),
        fontWeight: FontWeight.w700,
        fontSize: 24,
      )),
    ),
  );
}
