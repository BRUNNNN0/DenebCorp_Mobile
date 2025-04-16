final class CadastroEntity {
  final String firstName;
  final String lastName;
  //final DateTime birthDate;
  final String email;
  final String phoneNumber;
  final String password;

  const CadastroEntity({
    required this.firstName,
    required this.lastName,
    required this.password,
    //required this.birthDate,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
       // "birthDate": birthDate
    };
  }
}