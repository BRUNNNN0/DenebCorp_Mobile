import 'dart:convert';


final class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;


  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,

  });


  static UserEntity fromMap(
      Map<String, dynamic> userMap, 
  ) {
    return UserEntity(
      id: userMap[kKeyId],
      firstName: userMap[kKeyfirstName],
      lastName: userMap[kKeylastName],
      phoneNumber: userMap[kKeyphoneNumber],
      email: userMap[kKeyEmail],


    );
  }

  Map<String, dynamic> toMap() {
    return {
      kKeyId: id,
      kKeyfirstName: firstName,
      kKeylastName: lastName,
      kKeyEmail: email,
      kKeyphoneNumber: phoneNumber,
 
    };
  }

  static const String kKeyId = 'id';
  static const String kKeyfirstName = 'firstName';
  static const String kKeylastName = 'lastName';
  static const String kKeyEmail = 'email';
  static const String kKeyphoneNumber = 'phoneNumber';


}