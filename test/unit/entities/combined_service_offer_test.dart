import 'package:flutter_test/flutter_test.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:i_pet/domain/entities/serviceOffer/service_offer_entity.dart';
import 'package:i_pet/domain/entities/serviceServiceOfferEntity/service_service_offer_entity.dart';

void main() {
  group('CombinedServiceOffer', () {
    late ServiceEntity testService;
    late ServiceOfferEntity testOffer;

    setUp(() {
      testService = const ServiceEntity(
        name: 'Pet Grooming',
        createdAt: '2024-01-15 10:30:00',
        description: 'Professional pet grooming services',
        animalType: 'Dog',
      );

      testOffer = const ServiceOfferEntity(
        createdAt: '2024-01-20 14:45:00',
        price: 75.50,
        serviceId: 'service123',
        userId: 'user456',
      );
    });

    test('should create CombinedServiceOffer with all required properties', () {
      // Arrange
      const id = 'offer123';

      // Act
      final combinedOffer = CombinedServiceOffer(
        id: id,
        offer: testOffer,
        service: testService,
      );

      // Assert
      expect(combinedOffer.id, equals(id));
      expect(combinedOffer.offer, equals(testOffer));
      expect(combinedOffer.service, equals(testService));
    });

    test('should handle empty id', () {
      // Arrange & Act
      final combinedOffer = CombinedServiceOffer(
        id: '',
        offer: testOffer,
        service: testService,
      );

      // Assert
      expect(combinedOffer.id, isEmpty);
      expect(combinedOffer.offer, equals(testOffer));
      expect(combinedOffer.service, equals(testService));
    });

    test('should handle long id', () {
      // Arrange
      const longId = 'very_long_offer_id_with_many_characters_123456789';

      // Act
      final combinedOffer = CombinedServiceOffer(
        id: longId,
        offer: testOffer,
        service: testService,
      );

      // Assert
      expect(combinedOffer.id, equals(longId));
    });

    test('should handle special characters in id', () {
      // Arrange
      const specialId = 'offer-123_456@789#';

      // Act
      final combinedOffer = CombinedServiceOffer(
        id: specialId,
        offer: testOffer,
        service: testService,
      );

      // Assert
      expect(combinedOffer.id, equals(specialId));
    });

    test('should access nested properties correctly', () {
      // Arrange
      final combinedOffer = CombinedServiceOffer(
        id: 'test123',
        offer: testOffer,
        service: testService,
      );

      // Act & Assert
      expect(combinedOffer.offer.price, equals(75.50));
      expect(combinedOffer.offer.serviceId, equals('service123'));
      expect(combinedOffer.offer.userId, equals('user456'));
      expect(combinedOffer.service.name, equals('Pet Grooming'));
      expect(combinedOffer.service.description, equals('Professional pet grooming services'));
      expect(combinedOffer.service.animalType, equals('Dog'));
    });

    test('should work with different service and offer combinations', () {
      // Arrange
      final differentService = const ServiceEntity(
        name: 'Veterinary Care',
        createdAt: '2024-01-25 09:15:00',
        description: 'Complete veterinary services',
        animalType: 'Cat',
      );

      final differentOffer = const ServiceOfferEntity(
        createdAt: '2024-01-30 16:20:00',
        price: 150.0,
        serviceId: 'service789',
        userId: 'user101',
      );

      // Act
      final combinedOffer = CombinedServiceOffer(
        id: 'different123',
        offer: differentOffer,
        service: differentService,
      );

      // Assert
      expect(combinedOffer.id, equals('different123'));
      expect(combinedOffer.offer.price, equals(150.0));
      expect(combinedOffer.offer.serviceId, equals('service789'));
      expect(combinedOffer.service.name, equals('Veterinary Care'));
      expect(differentService.animalType, equals('Cat'));
    });

    test('should handle zero price in offer', () {
      // Arrange
      final zeroPriceOffer = const ServiceOfferEntity(
        createdAt: '2024-02-01 12:00:00',
        price: 0.0,
        serviceId: 'service999',
        userId: 'user888',
      );

      // Act
      final combinedOffer = CombinedServiceOffer(
        id: 'zero123',
        offer: zeroPriceOffer,
        service: testService,
      );

      // Assert
      expect(combinedOffer.offer.price, equals(0.0));
    });

    test('should handle empty strings in service properties', () {
      // Arrange
      final emptyService = const ServiceEntity(
        name: '',
        createdAt: '',
        description: '',
        animalType: '',
      );

      // Act
      final combinedOffer = CombinedServiceOffer(
        id: 'empty123',
        offer: testOffer,
        service: emptyService,
      );

      // Assert
      expect(combinedOffer.service.name, isEmpty);
      expect(combinedOffer.service.description, isEmpty);
      expect(combinedOffer.service.animalType, isEmpty);
    });
  });
} 