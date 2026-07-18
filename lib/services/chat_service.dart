import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/services/service_base.dart';

class ChatService extends ServiceBase<ChatService> {
  late final FirebaseFirestore _firestore;

  ChatService._internal() {
    _firestore = FirebaseFirestore.instance;
  }

  static ChatService get instance =>
      ServiceBase.getInstance<ChatService>(() => ChatService._internal());

  Future<void> sendMessage({required String message}) async {
    if (AuthService.instance.currentUser?.email == null) return;
    String email = AuthService.instance.currentUser!.email!;
    await _firestore.collection('messages').add({
      'message': message,
      'sender': email,
    });
  }
}
