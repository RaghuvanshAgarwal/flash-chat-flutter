import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  User? get currentUser {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser;
  }
}
