import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/dialogs.dart';
import 'package:flash_chat/modals/message.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/services/chat_service.dart';
import 'package:flutter/material.dart';

class ChatScreenController {
  String messageText = '';
  Future<void> logout() async {
    await AuthService.instance.logout();
  }

  Future<void> sendMessage({required BuildContext context}) async {
    try {
      await ChatService.instance.sendMessage(message: messageText);
    } on FirebaseException catch (e) {
      showAlert(context, 'Chat Error', e.message ?? 'Unknown error occured');
    }
  }

  Stream<List<Message>> messageStream() {
    return ChatService.instance.messageStream();
  }

  bool isMessageSentByLocalUser({required String sender}) {
    final email = AuthService.instance.currentUser?.email;
    if (email == null) return false;
    return email == sender;
  }
}
