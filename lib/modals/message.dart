import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String sender;
  final DateTime? timestamp;

  Message({required this.message, required this.sender, this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String? ?? '',
      sender: json['sender'] as String? ?? '',
      timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  @override
  String toString() {
    return '$sender [says] $message${timestamp != null ? ' at $timestamp' : ''}';
  }
}
