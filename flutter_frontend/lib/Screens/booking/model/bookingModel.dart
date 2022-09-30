import 'dart:convert';

BookingModel bookingModelFromJson(String str) => BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
    BookingModel({
        required this.date,
        required this.doctor,
        required this.time,
        required this.option,
    });

    String date;
    String doctor;
    String time;
    String option;

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        date: json["date"],
        doctor: json["doctor"],
        time: json["time"],
        option: json["option"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "doctor": doctor,
        "time": time,
        "option": option,
    };
}
