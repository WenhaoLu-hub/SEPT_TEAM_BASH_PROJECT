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

String? _dropdownValue;

class _BookingState extends State<Booking> {
  final _formKey = GlobalKey<FormState>();
  var doctorList = <String>["Doctor", "Patient"];
  var timeList = <String>["1 PM", "9 AM"];
  var mode = <String>["face to face", "online"];
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  final bookingController = Get.put(BookingController());
  void _submit() {
    if (_formKey.currentState!.validate()) {
      print("press the button");
      // print(_selectedDate as DateTime);
      print(_selectedDate);
      // final dateString = dateFormatter.format(_selectedDate as DateTime);
      // print('Selected date: $dateString');
      // DateFormat('dd/MM/yyyy').format(_selectedDate.)

      _formKey.currentState!.save();
    }
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = DateFormat('dd/MM/yyyy').format(args.value);
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
                      const BackButton(),
                      _title(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Selected date: $_selectedDate'),
                    ],
                  ),
                  SfDateRangePicker(
                    showNavigationArrow: true,
                    enablePastDates: false,
                    // onSelectionChanged: (value)=> setState(() {
                    //   // DateFormat('dd/MM/yyyy').format()
                    //   _selectedDate = value.toString();
                    // }),
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.single,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownSelector(
                    title: "available doctor",
                    defaultValue: "choose your doctor",
                    dropdownList: doctorList,
                    validator: (value) =>
                        value == null ? "please the account type" : null,
                    selectValue: _dropdownValue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownSelector(
                    title: "available time",
                    defaultValue: "choose your doctor",
                    dropdownList: timeList,
                    validator: (value) =>
                        value == null ? "time can not be empty" : null,
                    selectValue: _dropdownValue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownSelector(
                    title: "meeting option",
                    defaultValue: "choose your doctor",
                    dropdownList: mode,
                    validator: (value) =>
                        value == null ? "mode can not be empty" : null,
                    selectValue: _dropdownValue,
                  ),
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
