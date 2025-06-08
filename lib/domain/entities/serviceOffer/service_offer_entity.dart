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
    return ServiceOfferEntity(
      createdAt: map['createdAt'] ?? '',
      price: (map['price'] is num) ? (map['price'] as num).toDouble() : 0.0,
      serviceId: map['serviceId'] ?? '',
      userId: map['userId'] ?? '',
    );
  }
}
