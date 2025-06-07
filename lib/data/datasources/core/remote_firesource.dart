import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_pet/configs/environment_helper.dart';
import 'package:i_pet/data/datasources/core/data_source.dart';
import 'package:i_pet/domain/entities/login/login_entity.dart';
import 'package:i_pet/domain/error/cadastro/cadastro_exception.dart';
import 'package:i_pet/domain/error/cadastro/fireExceptionsCadastro.dart';
import 'package:i_pet/domain/error/login/fireExceptionsAuth.dart';
import 'package:i_pet/domain/error/login/login_exception.dart';

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

}


  

