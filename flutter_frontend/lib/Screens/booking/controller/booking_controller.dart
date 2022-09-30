import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/Screens/booking/model/bookingModel.dart';

class BookingController extends GetxController {
  TextEditingController doctorEditingController = TextEditingController();
  TextEditingController dateEditingController = TextEditingController();
  TextEditingController timeEditingController = TextEditingController();
  TextEditingController optionEditingController = TextEditingController();

  void booking() async {
    BookingModel bookingModel = BookingModel(
        date: dateEditingController.text,
        doctor: doctorEditingController.text,
        time: timeEditingController.text,
        option: optionEditingController.text);
    print(
        "booking body -> \n${bookingModelToJson(bookingModel)}");
    Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: 'Successfully',
        middleText: 'remember meet your docto on booking day',
        textConfirm: 'Okay',
        confirm: OutlinedButton.icon(
          onPressed: () => Get.offAndToNamed("/patient"),
          icon: const Icon(
            Icons.check,
            color: Colors.blue,
          ),
          label: const Text(
            'Okay',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
  }

}
