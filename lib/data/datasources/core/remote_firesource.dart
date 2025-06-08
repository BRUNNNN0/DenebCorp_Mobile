import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:i_pet/configs/environment_helper.dart';
import 'package:i_pet/configs/factory_viewmodel.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/cadastro/cadastro_entity.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';
import 'package:i_pet/domain/entities/serviceOffer/service_offer_entity.dart';
import 'package:i_pet/domain/entities/serviceServiceOfferEntity/service_service_offer_entity.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';
import 'package:i_pet/domain/error/cadastro/fireExceptionsCadastro.dart';
import 'package:i_pet/domain/error/login/fireExceptionsAuth.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';
import 'package:i_pet/domain/entities/service/service_entity.dart';

class RemoteFiresource implements IRemoteFireSource {
  final IEnvironmentHelper _environment;
  
  const RemoteFiresource(this._environment,);
  
  
  @override
  Future<String> registerAuth(String email, String password) async {
    final auth = _environment.auth!;
      try{
      final UserCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
  );

    final userId = UserCredential.user?.uid;
  if (userId == null) throw RegisterFailedException();

    return userId;

  } on FirebaseAuthException catch (e) {
      throw FirebaseCadastroExceptionMapper.map(e.code);
        } catch (_) {
          throw RegisterFailedException();
      }
  
  }
  
  @override
  Future<void> registerInfoUser(String urlID, Map<String, dynamic> userData) async {
    final firestore = _environment.firestore!;

    try {
      await firestore.collection('users').doc(urlID).set(userData);
    } catch (e) {
      throw Exception('Erro ao salvar dados do usuário: $e');
    }
  }

Future<String?> acessar(LoginEntity entity) async {
  final auth = _environment.auth!;
  try {
    final userCredential = await auth.signInWithEmailAndPassword(
      email: entity.login,
      password: entity.password,
    );

    final user = userCredential.user;
    if (user == null) {
      throw Exception('Usuário não encontrado após login.');
    }
   
    final idToken = await user.getIdToken();
    return idToken;
  } on FirebaseAuthException catch (e) {
      throw FirebaseLoginExceptionMapper.map(e.code);
    }catch (_) {
      throw LoginNotFoundException();
  }
}

Future<Map<String, dynamic>> getUserInfo(String? urlID) async {
  final auth = _environment.auth!;
  final firestore = _environment.firestore!;

    if (urlID == null) {
      throw Exception('Token do usuário não encontrado.');
    }

  try {
    final currentUser = auth.currentUser;

    if (currentUser == null) {
      throw Exception('Usuário não autenticado.');
    }

    final docRef = firestore.collection('users').doc(currentUser.uid);
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      throw Exception('Dados do usuário não encontrados no Firestore.');
    }

    return docSnapshot.data()!;
    
  } catch (e) {
    throw Exception('Erro ao buscar dados do usuário: $e');
  }
}

Future<void> recoveryPassword(String login) async {
  final auth = _environment.auth!;
  try {
    await auth.sendPasswordResetEmail(email: login);
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message ?? 'Erro ao enviar e-mail');
  }
}

Future<List<ServiceServiceOfferEntity>> getServices() async {
  try {
    final db = FirebaseFirestore.instance;

    final offersSnapshot = await db.collection('service-offer').get();

    final offers = offersSnapshot.docs.map((offerDoc) async {
      final offerData = offerDoc.data();
      if (offerData == null || !offerData.containsKey('service_id')) {
        print("Oferta sem service_id: ${offerDoc.id}");
        return null;
      }

      final offer = ServiceOfferEntity.fromMap(offerData);

      final serviceDoc =
          await db.collection('services').doc(offer.serviceId).get();

      if (!serviceDoc.exists || serviceDoc.data() == null) {
        print("Serviço base não encontrado: ${offer.serviceId}");
        return null;
      }

      final service = ServiceEntity.fromMap(serviceDoc.data()!);

      return ServiceServiceOfferEntity(
        id: offerDoc.id,
        offer: offer,
        service: service,
      );
    }).toList();

    final results = await Future.wait(offers);
    return results.whereType<ServiceServiceOfferEntity>().toList();
  } catch (e) {
    print("Erro ao buscar serviços: $e");
    rethrow;
  }
}

Future<String?> createService(ServiceEntity service) async{
  try{
    final firestore = _environment.firestore!;
    final doc = await firestore.collection("services").add(service.toMap());
    return doc.id;
  }
  catch (e) {
      print("Error adding service: $e");
      return null;
    }
}

Future<String?> createServiceOffer(ServiceOfferEntity serviceOffer, String userId) async{
  try{
    final firestore = _environment.firestore!;
    final auth = _environment.auth!;

    final user=auth.currentUser;

    if (user == null || user.uid != userId) {
      throw Exception("Usuário não autenticado ou ID de usuário inválido.");
    }
    final doc = await firestore.collection("services").add(serviceOffer.toMap());
    return doc.id;
  } 
  catch(e){
    print("Error adding service: $e");
    return null;
  }
}

}