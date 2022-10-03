import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.age,
        required this.phoneNumber,
        required this.address,
        required this.email,
        required this.password,
        required this.type,
    });

    int id;
    String firstName;
    String lastName;
    String gender;
    int age;
    int phoneNumber;
    String address;
    String email;
    String password;
    String type;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        age: json["age"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "age": age,
        "phoneNumber": phoneNumber,
        "address": address,
        "email": email,
        "password": password,
        "type": type,
    };
}
