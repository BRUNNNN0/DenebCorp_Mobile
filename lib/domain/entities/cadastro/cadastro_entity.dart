final class CadastroEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;

  const CadastroEntity({
    required this.firstName,
    required this.lastName,
    required this.password,
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
    };
  }
}