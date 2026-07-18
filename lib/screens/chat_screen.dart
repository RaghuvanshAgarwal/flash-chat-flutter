import 'package:flash_chat/components/dialogs.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flash_chat/controllers/chat_screen_controller.dart';
import 'package:flash_chat/modals/message.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  static const String kPageName = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatScreenController controller;
  late final TextEditingController messageBoxController;
  bool isSendButtonActive = true;

  @override
  void initState() {
    controller = ChatScreenController();
    messageBoxController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              await controller.logout();
              Navigator.pop(context, WelcomeScreen.kPageName);
            },
          ),
        ],
        title: Text('⚡️Chat'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: controller.messageStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    showAlert(
                      context,
                      'Error Detected',
                      snapshot.error.toString(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final messages = snapshot.data!;
                  return ListView.builder(
                    reverse: true, // shows latest at bottom, easy auto-scroll
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isMine = controller.isMessageSentByLocalUser(
                        sender: message.sender,
                      );
                      return MessageBubble(isMine: isMine, message: message);
                    },
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageBoxController,
                      onChanged: (value) {
                        //Do something with the user input.
                        controller.messageText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: isSendButtonActive
                        ? () async {
                            setState(() {
                              isSendButtonActive = false;
                            });
                            await controller.sendMessage(context: context);
                            messageBoxController.clear();
                            controller.messageText = '';
                            if (mounted) {
                              setState(() {
                                isSendButtonActive = true;
                              });
                            }
                          }
                        : null,
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
