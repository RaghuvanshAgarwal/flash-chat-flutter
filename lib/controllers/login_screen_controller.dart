import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/dialogs.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreenController {
  String email = '';
  String password = '';
  late final AuthService service;

  LoginScreenController() {
    service = AuthService();
  }

  Future<bool> login(BuildContext context) async {
    try {
      await service.login(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'invalid-email':
          message = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          message = 'This user has been disabled.';
          break;
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided for that user.';
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          break;
        case 'weak-password':
          message = 'Please choose a stronger password.';
          break;
        case 'operation-not-allowed':
          message = 'This sign-in method is not enabled.';
          break;
        case 'too-many-requests':
          message = 'Too many requests. Please try again later.';
          break;
        case 'network-request-failed':
          message = 'Please check your internet connection.';
          break;
        case 'invalid-credential':
        case 'credential-already-in-use':
        case 'account-exists-with-different-credential':
          message = 'The provided credentials are invalid or already in use.';
          break;
        case 'requires-recent-login':
          message = 'Please log in again to continue.';
          break;
        case 'invalid-verification-code':
        case 'invalid-verification-id':
          message = 'The verification code is invalid.';
          break;
        default:
          message = e.message ?? 'An unknown Firebase error occurred.';
      }

      showAlert(context, 'Login Failed', message);
      return false;
    }
  }
}
