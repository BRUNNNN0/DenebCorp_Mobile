final class CadastroEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String birth_date;
  final String cpf;

  const CadastroEntity({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.birth_date,
    required this.cpf,
  });

  Map<String, dynamic> toMap() {
 return {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,          
    "phoneNumber": phoneNumber,
    "birth_date": birth_date,
    "cpf": cpf,
  };
}
}