import 'package:cloud_firestore/cloud_firestore.dart';

final class ServiceOfferEntity {
  final String createdAt;   // formato: "2025-06-10 07:59:45.551690"
  final double price;
  final String serviceId;
  final String userId;

  const ServiceOfferEntity({
    required this.createdAt,
    required this.price,
    required this.serviceId,
    required this.userId,
  });

  /// Converte para um mapa que será salvo no Firestore
  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'price': price,
      'serviceId': serviceId,
      'userId': userId,
    };
  }

  /// Cria a entidade a partir de um mapa do Firestore
  static ServiceOfferEntity fromMap(Map<String, dynamic> map) {
    final rawTimestamp = map['createdAt'];
    String createdAtString = '';

    if (rawTimestamp is Timestamp) {
      createdAtString = rawTimestamp.toDate().toString();
    } else if (rawTimestamp is String) {
      createdAtString = rawTimestamp;
    }

    return ServiceOfferEntity(
      createdAt: createdAtString,
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      serviceId: map['serviceId'] ?? '',
      userId: map['userId'] ?? '',
    );
  }
}
