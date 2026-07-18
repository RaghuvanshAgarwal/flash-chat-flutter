import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/service_base.dart';

class AuthService extends ServiceBase<AuthService> {
  AuthService._internal() {
    _auth = FirebaseAuth.instance;
  }

  static AuthService get instance =>
      ServiceBase.getInstance<AuthService>(() => AuthService._internal());

  late final FirebaseAuth _auth;

  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<void> logout() async {
    if (currentUser == null) return;
    await _auth.signOut();
  }

  User? get currentUser {
    return _auth.currentUser;
  }
}
