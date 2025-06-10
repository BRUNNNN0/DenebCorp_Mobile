import 'package:cloud_firestore/cloud_firestore.dart';

final class ServiceOfferEntity {
  final String createdAt;
  final double price;
  final String serviceId;
  final String userId;

  const ServiceOfferEntity({
    required this.createdAt,
    required this.price,
    required this.serviceId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'price': price,
      'serviceId': serviceId,
      'userId': userId,
    };
  }


  static ServiceOfferEntity fromMap(Map<String, dynamic> map) {

  final timestamp = map['created_at'];
  String createdAtString = '';

  if (timestamp != null && timestamp is Timestamp) {
    createdAtString = timestamp.toDate().toString(); // converte para string legível
  } else if (timestamp != null && timestamp is String) {
    createdAtString = timestamp; // já é string, passa direto
  }


    return ServiceOfferEntity(
      createdAt: createdAtString,
      price: (map['price'] is num) ? (map['price'] as num).toDouble() : 0.0,
      serviceId: map['service_id'] ?? '',
      userId: map['user_id'] ?? '',
    );
  }
}
