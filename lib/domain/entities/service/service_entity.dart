final class ServiceEntity {
  final String name;
  final String createdAt;
  final String description;
  final String animalType;

  const ServiceEntity({
    required this.name,
    required this.createdAt,
    required this.description,
    required this.animalType,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "createdAt": createdAt,
      "description": description,
      "animalType": animalType,
    };
  }

  static ServiceEntity fromMap(Map<String, dynamic> map) {
    return ServiceEntity(
      name: map['name'] ?? '',
      createdAt: map['createdAt'] ?? '',
      description: map['description'] ?? '',
      animalType: map['animalType'] ?? '',
    );
  }
}
