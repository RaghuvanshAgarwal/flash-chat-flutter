import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/auth_service.dart';

class LoginScreenController {
  String email = '';
  String password = '';
  late final AuthService service;

  LoginScreenController() {
    service = AuthService();
  }

  Future<bool> login() async {
    try {
      await service.login(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
  }
}
