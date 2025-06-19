import 'package:flutter_test/flutter_test.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';

void main() {
  group('CadastroEntity', () {
    test('should create CadastroEntity with all required properties', () {
      // Arrange
      const firstName = 'John';
      const lastName = 'Doe';
      const email = 'john.doe@example.com';
      const phoneNumber = '+5511999999999';
      const password = 'password123';
      const birthDate = '1990-01-01';
      const cpf = '12345678901';

      // Act
      const entity = CadastroEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        birth_date: birthDate,
        cpf: cpf,
      );

      // Assert
      expect(entity.firstName, equals(firstName));
      expect(entity.lastName, equals(lastName));
      expect(entity.email, equals(email));
      expect(entity.phoneNumber, equals(phoneNumber));
      expect(entity.password, equals(password));
      expect(entity.birth_date, equals(birthDate));
      expect(entity.cpf, equals(cpf));
    });

    test('should convert to map correctly', () {
      // Arrange
      const entity = CadastroEntity(
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@example.com',
        phoneNumber: '+5511888888888',
        password: 'securepass',
        birth_date: '1985-05-15',
        cpf: '98765432109',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['firstName'], equals('Jane'));
      expect(map['lastName'], equals('Smith'));
      expect(map['email'], equals('jane.smith@example.com'));
      expect(map['phoneNumber'], equals('+5511888888888'));
      expect(map['birth_date'], equals('1985-05-15'));
      expect(map['cpf'], equals('98765432109'));
      // Note: password is not included in toMap() for security reasons
    });

    test('should handle empty strings in properties', () {
      // Arrange & Act
      const entity = CadastroEntity(
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        password: '',
        birth_date: '',
        cpf: '',
      );

      // Assert
      expect(entity.firstName, isEmpty);
      expect(entity.lastName, isEmpty);
      expect(entity.email, isEmpty);
      expect(entity.phoneNumber, isEmpty);
      expect(entity.password, isEmpty);
      expect(entity.birth_date, isEmpty);
      expect(entity.cpf, isEmpty);
    });

    test('should handle special characters in properties', () {
      // Arrange
      const entity = CadastroEntity(
        firstName: 'João',
        lastName: 'Silva-Santos',
        email: 'joao.silva@empresa.com.br',
        phoneNumber: '+55 (11) 99999-9999',
        password: 'senha@123#',
        birth_date: '1990-12-25',
        cpf: '123.456.789-01',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['firstName'], equals('João'));
      expect(map['lastName'], equals('Silva-Santos'));
      expect(map['email'], equals('joao.silva@empresa.com.br'));
      expect(map['phoneNumber'], equals('+55 (11) 99999-9999'));
      expect(map['birth_date'], equals('1990-12-25'));
      expect(map['cpf'], equals('123.456.789-01'));
      // Note: password is not included in toMap() for security reasons
    });
  });
} 