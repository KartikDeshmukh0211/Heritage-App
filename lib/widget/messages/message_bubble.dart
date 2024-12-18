import 'package:flutter/material.dart';
import 'package:heritage_app/model/chatbot/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});
  final Message message;

  final Widget loader = const SizedBox(
    height: 24,
    width: 24,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: Colors.blueAccent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * 0.7, // 70% of screen width
          ),
          decoration: BoxDecoration(
            color: message.isMe
                ? const Color.fromARGB(255, 73, 135, 206) // User bubble color
                : const Color(0xFFE0E0E0), // Chatbot bubble color
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: message.isMe
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              bottomRight: message.isMe
                  ? const Radius.circular(0)
                  : const Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.isMe ? "You" : "Chatbot",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: message.isMe ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              message.isLoaging
                  ? Center(
                      child: loader, 
                    )
                  : Text(
                      message.msg,
                      style: TextStyle(
                        fontSize: 16,
                        color: message.isMe ? Colors.white : Colors.black87,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
