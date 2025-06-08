import 'package:i_pet/domain/entities/service/service_entity.dart';
import 'package:i_pet/domain/entities/serviceOffer/service_offer_entity.dart';

final class CombinedServiceOffer {
  final String id; // Firestore document ID for the offer
  final ServiceOfferEntity offer;
  final ServiceEntity service;

  const CombinedServiceOffer({
    required this.id,
    required this.offer,
    required this.service,
  });
}
