import 'package:flutter_test/flutter_test.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';

void main() {
  group('ServiceEntity', () {
    test('should create ServiceEntity with all required properties', () {
      // Arrange
      const name = 'Pet Grooming';
      const createdAt = '2024-01-15 10:30:00';
      const description = 'Professional pet grooming services';
      const animalType = 'Dog';

      // Act
      const entity = ServiceEntity(
        name: name,
        createdAt: createdAt,
        description: description,
        animalType: animalType,
      );

      // Assert
      expect(entity.name, equals(name));
      expect(entity.createdAt, equals(createdAt));
      expect(entity.description, equals(description));
      expect(entity.animalType, equals(animalType));
    });

    test('should convert to map correctly', () {
      // Arrange
      const entity = ServiceEntity(
        name: 'Veterinary Care',
        createdAt: '2024-01-20 14:45:00',
        description: 'Complete veterinary services',
        animalType: 'Cat',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['name'], equals('Veterinary Care'));
      expect(map['createdAt'], equals('2024-01-20 14:45:00'));
      expect(map['description'], equals('Complete veterinary services'));
      expect(map['animalType'], equals('Cat'));
    });

    test('should create from map with all fields', () {
      // Arrange
      final map = {
        'name': 'Pet Training',
        'createdAt': '2024-01-25 09:15:00',
        'description': 'Professional pet training services',
        'animalType': 'Dog',
      };

      // Act
      final entity = ServiceEntity.fromMap(map);

      // Assert
      expect(entity.name, equals('Pet Training'));
      expect(entity.createdAt, equals('2024-01-25 09:15:00'));
      expect(entity.description, equals('Professional pet training services'));
      expect(entity.animalType, equals('Dog'));
    });

    test('should create from map with missing fields (should use empty strings)', () {
      // Arrange
      final map = {
        'name': 'Pet Walking',
        // missing createdAt, description, animalType
      };

      // Act
      final entity = ServiceEntity.fromMap(map);

      // Assert
      expect(entity.name, equals('Pet Walking'));
      expect(entity.createdAt, isEmpty);
      expect(entity.description, isEmpty);
      expect(entity.animalType, isEmpty);
    });

    test('should create from map with null values (should use empty strings)', () {
      // Arrange
      final map = {
        'name': null,
        'createdAt': null,
        'description': null,
        'animalType': null,
      };

      // Act
      final entity = ServiceEntity.fromMap(map);

      // Assert
      expect(entity.name, isEmpty);
      expect(entity.createdAt, isEmpty);
      expect(entity.description, isEmpty);
      expect(entity.animalType, isEmpty);
    });

    test('should handle empty strings in properties', () {
      // Arrange & Act
      const entity = ServiceEntity(
        name: '',
        createdAt: '',
        description: '',
        animalType: '',
      );

      // Assert
      expect(entity.name, isEmpty);
      expect(entity.createdAt, isEmpty);
      expect(entity.description, isEmpty);
      expect(entity.animalType, isEmpty);
    });

    test('should handle special characters in properties', () {
      // Arrange
      const entity = ServiceEntity(
        name: 'Pet Care & Grooming',
        createdAt: '2024-01-30 16:20:00',
        description: 'Serviços de cuidados e tosa para pets',
        animalType: 'Cão/Gato',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['name'], equals('Pet Care & Grooming'));
      expect(map['createdAt'], equals('2024-01-30 16:20:00'));
      expect(map['description'], equals('Serviços de cuidados e tosa para pets'));
      expect(map['animalType'], equals('Cão/Gato'));
    });

    test('should round trip: toMap -> fromMap should produce same entity', () {
      // Arrange
      const originalEntity = ServiceEntity(
        name: 'Pet Sitting',
        createdAt: '2024-02-01 12:00:00',
        description: 'In-home pet sitting services',
        animalType: 'All Animals',
      );

      // Act
      final map = originalEntity.toMap();
      final reconstructedEntity = ServiceEntity.fromMap(map);

      // Assert
      expect(reconstructedEntity.name, equals(originalEntity.name));
      expect(reconstructedEntity.createdAt, equals(originalEntity.createdAt));
      expect(reconstructedEntity.description, equals(originalEntity.description));
      expect(reconstructedEntity.animalType, equals(originalEntity.animalType));
    });
  });
} 