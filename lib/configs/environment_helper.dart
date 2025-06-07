import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class IEnvironmentHelper {
  String get urlAuthentication;
  String get urlRegister;
  String get urlUserInformation;
  FirebaseAuth get auth;
  FirebaseFirestore get firestore;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();


  String get _urlBase => 'http://10.0.0.111:8080';

  @override
  String get urlAuthentication => '$_urlBase/auth/login';

  @override
  String get urlUserInformation => '$_urlBase/users/me';

  String get urlRegister => '$_urlBase/auth/register';

  @override
  FirebaseAuth get auth => FirebaseAuth. instance;

  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

}

