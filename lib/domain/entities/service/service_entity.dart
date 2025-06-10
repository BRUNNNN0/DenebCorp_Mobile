final class ServiceEntity {
  final String name;
  final String createdAt;
  final String description;
  final String animalType;
  final String whatsApp_number;

  const ServiceEntity({
    required this.name,
    required this.createdAt,
    required this.description,
    required this.animalType,
    required this.whatsApp_number,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "createdAt": createdAt,
      "description": description,
      "animalType": animalType,
      "whatsApp_number": whatsApp_number,
    };
  }

  static ServiceEntity fromMap(Map<String, dynamic> map) {
    return ServiceEntity(
      name: map['name'] ?? '',
      createdAt: map['createdAt'] ?? '',
      description: map['description'] ?? '',
      animalType: map['animalType'] ?? '',
      whatsApp_number: map['whatsApp_number'] ?? '',
    );
  }
}
