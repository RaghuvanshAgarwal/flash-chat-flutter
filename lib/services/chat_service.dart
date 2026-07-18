import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/modals/message.dart';
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
    String sender = AuthService.instance.currentUser!.email!;
    await _firestore
        .collection('messages')
        .add(Message(message: message, sender: sender).toJson());
  }

  Stream<List<Message>> messageStream() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList(),
        );
  }
}
