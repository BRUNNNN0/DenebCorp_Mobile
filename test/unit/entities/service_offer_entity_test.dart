import 'package:flutter_test/flutter_test.dart';
import 'package:i_pet/domain/entities/serviceOffer/service_offer_entity.dart';

void main() {
  group('ServiceOfferEntity', () {
    test('should create ServiceOfferEntity with all required properties', () {
      // Arrange
      const createdAt = '2024-01-15 10:30:00';
      const price = 50.0;
      const serviceId = 'service123';
      const userId = 'user456';

      // Act
      const entity = ServiceOfferEntity(
        createdAt: createdAt,
        price: price,
        serviceId: serviceId,
        userId: userId,
      );

      // Assert
      expect(entity.createdAt, equals(createdAt));
      expect(entity.price, equals(price));
      expect(entity.serviceId, equals(serviceId));
      expect(entity.userId, equals(userId));
    });

    test('should convert to map correctly', () {
      // Arrange
      const entity = ServiceOfferEntity(
        createdAt: '2024-01-20 14:45:00',
        price: 75.50,
        serviceId: 'service789',
        userId: 'user101',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['createdAt'], equals('2024-01-20 14:45:00'));
      expect(map['price'], equals(75.50));
      expect(map['serviceId'], equals('service789'));
      expect(map['userId'], equals('user101'));
    });

    test('should create from map with all fields', () {
      // Arrange
      final map = {
        'createdAt': '2024-01-25 09:15:00',
        'price': 100.0,
        'serviceId': 'service456',
        'userId': 'user789',
      };

      // Act
      final entity = ServiceOfferEntity.fromMap(map);

      // Assert
      expect(entity.createdAt, equals('2024-01-25 09:15:00'));
      expect(entity.price, equals(100.0));
      expect(entity.serviceId, equals('service456'));
      expect(entity.userId, equals('user789'));
    });

    test('should create from map with missing fields (should use defaults)', () {
      // Arrange
      final map = {
        'createdAt': '2024-01-30 12:00:00',
        // missing price, serviceId, userId
      };

      // Act
      final entity = ServiceOfferEntity.fromMap(map);

      // Assert
      expect(entity.createdAt, equals('2024-01-30 12:00:00'));
      expect(entity.price, equals(0.0));
      expect(entity.serviceId, isEmpty);
      expect(entity.userId, isEmpty);
    });

    test('should create from map with null values (should use defaults)', () {
      // Arrange
      final map = {
        'createdAt': null,
        'price': null,
        'serviceId': null,
        'userId': null,
      };

      // Act
      final entity = ServiceOfferEntity.fromMap(map);

      // Assert
      expect(entity.createdAt, isEmpty);
      expect(entity.price, equals(0.0));
      expect(entity.serviceId, isEmpty);
      expect(entity.userId, isEmpty);
    });

    test('should handle integer price values', () {
      // Arrange
      final map = {
        'createdAt': '2024-02-01 10:00:00',
        'price': 25, // integer instead of double
        'serviceId': 'service123',
        'userId': 'user456',
      };

      // Act
      final entity = ServiceOfferEntity.fromMap(map);

      // Assert
      expect(entity.price, equals(25.0));
    });

    test('should handle zero price', () {
      // Arrange
      const entity = ServiceOfferEntity(
        createdAt: '2024-02-02 15:30:00',
        price: 0.0,
        serviceId: 'service999',
        userId: 'user888',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['price'], equals(0.0));
    });

    test('should handle negative price', () {
      // Arrange
      const entity = ServiceOfferEntity(
        createdAt: '2024-02-03 08:45:00',
        price: -10.0,
        serviceId: 'service777',
        userId: 'user666',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['price'], equals(-10.0));
    });

    test('should handle empty strings in properties', () {
      // Arrange & Act
      const entity = ServiceOfferEntity(
        createdAt: '',
        price: 0.0,
        serviceId: '',
        userId: '',
      );

      // Assert
      expect(entity.createdAt, isEmpty);
      expect(entity.price, equals(0.0));
      expect(entity.serviceId, isEmpty);
      expect(entity.userId, isEmpty);
    });

    test('should round trip: toMap -> fromMap should produce same entity', () {
      // Arrange
      const originalEntity = ServiceOfferEntity(
        createdAt: '2024-02-05 16:20:00',
        price: 125.75,
        serviceId: 'service555',
        userId: 'user444',
      );

      // Act
      final map = originalEntity.toMap();
      final reconstructedEntity = ServiceOfferEntity.fromMap(map);

      // Assert
      expect(reconstructedEntity.createdAt, equals(originalEntity.createdAt));
      expect(reconstructedEntity.price, equals(originalEntity.price));
      expect(reconstructedEntity.serviceId, equals(originalEntity.serviceId));
      expect(reconstructedEntity.userId, equals(originalEntity.userId));
    });

    test('should handle very large price values', () {
      // Arrange
      const entity = ServiceOfferEntity(
        createdAt: '2024-02-06 11:00:00',
        price: 999999.99,
        serviceId: 'service333',
        userId: 'user222',
      );

      // Act
      final map = entity.toMap();

      // Assert
      expect(map['price'], equals(999999.99));
    });
  });
} 