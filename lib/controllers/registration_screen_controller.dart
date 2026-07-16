import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/auth_service.dart';

class RegistrationScreenController {
  String email = '';
  String password = '';
  late final AuthService service;

  RegistrationScreenController() {
    service = AuthService();
  }

  Future<bool> register() async {
    try {
      await service.register(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
  }

  User? get currentUser {
    return service.currentUser;
  }
}
