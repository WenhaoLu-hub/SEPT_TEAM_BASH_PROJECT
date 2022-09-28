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
  void _submit(){
    
    if(_formKey.currentState!.validate()){
      print("press the button");
      print('Selected date: ${_selectedDate}');
      // DateFormat('dd/MM/yyyy').format(_selectedDate.)
      print('Selected date count: $_dateCount');
      print('Selected range: $_range');
      print('Selected ranges count: $_rangeCount');
      _formKey.currentState!.save();
    }
  }

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    // setState(() {
    //   if (args.value is PickerDateRange) {
    //     _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
    //         // ignore: lines_longer_than_80_chars
    //         ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    //   } else if (args.value is DateTime) {
    //     _selectedDate = args.value.toString();
    //   } else if (args.value is List<DateTime>) {
    //     _dateCount = args.value.length.toString();
    //   } else {
    //     _rangeCount = args.value.length.toString();
    //   }
    // });
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
                  
                  SfDateRangePicker(
                    showNavigationArrow: true,
                    enablePastDates: false,
                    onSelectionChanged: (value)=> setState(() {
                      _selectedDate = value.toString();
                    }),
                    selectionMode: DateRangePickerSelectionMode.single,
                    // maxDate:1;
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

