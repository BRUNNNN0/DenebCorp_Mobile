import 'package:flutter_test/flutter_test.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';

void main() {
  group('LoginEntity', () {
    test('should create LoginEntity with required properties', () {
      // Arrange
      const login = 'user@example.com';
      const password = 'password123';

      // Act
      const entity = LoginEntity(
        login: login,
        password: password,
      );

      // Assert
      expect(entity.login, equals(login));
      expect(entity.password, equals(password));
    });

    test('should convert to map correctly', () {
      // Arrange
      const entity = LoginEntity(
        login: 'test@example.com',
        password: 'securepass',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['username'], equals('test@example.com'));
      expect(map['password'], equals('securepass'));
    });

    test('should handle empty strings', () {
      // Arrange & Act
      const entity = LoginEntity(
        login: '',
        password: '',
      );

      // Assert
      expect(entity.login, isEmpty);
      expect(entity.password, isEmpty);
    });

    test('should handle special characters in login and password', () {
      // Arrange
      const entity = LoginEntity(
        login: 'user+tag@domain.com',
        password: 'senha@123#!',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['username'], equals('user+tag@domain.com'));
      expect(map['password'], equals('senha@123#!'));
    });

    test('should handle long strings', () {
      // Arrange
      const longLogin = 'very.long.email.address.with.many.parts@very.long.domain.com';
      const longPassword = 'very_long_password_with_many_characters_and_numbers_123456789';

      // Act
      const entity = LoginEntity(
        login: longLogin,
        password: longPassword,
      );

      // Assert
      expect(entity.login, equals(longLogin));
      expect(entity.password, equals(longPassword));
    });
  });
} 