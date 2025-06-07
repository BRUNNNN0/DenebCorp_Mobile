import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_pet/configs/environment_helper.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';
import 'package:i_pet/domain/error/fire_base_exceptions/fireExceptions.dart';

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
      throw FirebaseExceptionMapper.map(e.code);
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
}




  

