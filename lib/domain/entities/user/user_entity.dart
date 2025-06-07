final class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String birth_date;
  final String cpf;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birth_date,
    required this.cpf,
  });

  static UserEntity fromMap(Map<String, dynamic> userMap) {
    return UserEntity(
      id: userMap[kKeyId] ?? '',
      firstName: userMap[kKeyFirstName] ?? '',
      lastName: userMap[kKeyLastName] ?? '',
      email: userMap[kKeyEmail] ?? '',
      phoneNumber: userMap[kKeyPhoneNumber] ?? '',
      birth_date: userMap[kKeyBirthDate] ?? '',
      cpf: userMap[kKeyCpf] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      kKeyId: id,
      kKeyFirstName: firstName,
      kKeyLastName: lastName,
      kKeyEmail: email,
      kKeyPhoneNumber: phoneNumber,
      kKeyBirthDate: birth_date,
      kKeyCpf: cpf,
    };
  }

  // Constantes das chaves
  static const String kKeyId = 'id';
  static const String kKeyFirstName = 'firstName';
  static const String kKeyLastName = 'lastName';
  static const String kKeyEmail = 'email';
  static const String kKeyPhoneNumber = 'phoneNumber';
  static const String kKeyBirthDate = 'birth_date';
  static const String kKeyCpf = 'cpf';
}