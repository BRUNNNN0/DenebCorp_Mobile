import 'dart:convert';


final class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String profileImage;


  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
 

  });


  static UserEntity _fromMap({
    required Map<String, dynamic> userMap, 
  }) {
    return UserEntity(
      id: userMap[kKeyId],
      firstName: userMap[kKeyfirstName],
      lastName: userMap[kKeylastName],
      phoneNumber: userMap[kKeyphoneNumber],
      email: userMap[kKeyEmail],
      profileImage: userMap[kKeyProfileImage],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      kKeyId: id,
      kKeyfirstName: firstName,
      kKeylastName: lastName,
      kKeyEmail: email,
      kKeyphoneNumber: phoneNumber,
      kKeyProfileImage: profileImage
    };
  }

  static const String kKeyId = 'id';
  static const String kKeyfirstName = 'nome';
  static const String kKeylastName = 'sobrenome';
  static const String kKeyEmail = 'email';
  static const String kKeyphoneNumber = 'telefone';
  static const String kKeyProfileImage = 'fotoPerfil';

}