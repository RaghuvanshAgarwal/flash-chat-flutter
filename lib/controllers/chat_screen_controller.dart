import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/services/chat_service.dart';

class ChatScreenController {
  String messageText = '';
  Future<void> logout() async {
    await AuthService.instance.logout();
  }

  Future<void> sendMessage() async {
    await ChatService.instance.sendMessage(message: messageText);
  }
}
