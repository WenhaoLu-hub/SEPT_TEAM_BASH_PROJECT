import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:team_bash_project/Screens/booking/controller/booking_controller.dart';
import 'package:team_bash_project/Screens/components/roundedButton.dart';

import '../signup/signUpForm.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

String? _dropdownValue;

class _BookingState extends State<Booking> {
  var list = <String>["Doctor", "Patient"];
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  final bookingController = Get.put(BookingController());

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
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const BackButton(),
                  _loginLabel(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Text("time picker"),
              // Text("choose doctor"),
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   top: 0,
              //   height: 80,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text('Selected date: $_selectedDate'),
              //       Text('Selected date count: $_dateCount'),

              //       Text('Selected ranges count: $_rangeCount')
              //     ],
              //   ),
              // ),
              // Text(
              //   "Date Picker",
              //   style: GoogleFonts.josefinSans(
              //       textStyle: const TextStyle(
              //           color: Color(0xff293462),
              //           fontWeight: FontWeight.w600,
              //           fontSize: 20)),
              // ),
              Positioned(
                left: 0,
                top: 80,
                right: 0,
                bottom: 0,
                child: SfDateRangePicker(
                  showNavigationArrow: true,
                  enablePastDates: false,
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  // maxDate:1;
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownButtonSelector(
                  accountType: "available doctor",
                  bookingController: bookingController),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                text: "Submit",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _loginLabel() {
  return Center(
    child: Text(
      "Book with your doctor",
      style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
        color: Color(0xff164276),
        fontWeight: FontWeight.w700,
        fontSize: 24,
      )),
    ),
  );
}

class DropDownButtonSelector extends StatefulWidget {
  final BookingController bookingController;
  final String? Function(String?)? validator;
  final String accountType;
  const DropDownButtonSelector({
    Key? key,
    this.validator,
    required this.accountType,
    required this.bookingController,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DropDownButtonState();
  }
}

class DropDownButtonState extends State<DropDownButtonSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.accountType,
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
            hint: const Text("Choose your doctor"),
            value: _dropdownValue,
            style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            items: list
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _dropdownValue = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
