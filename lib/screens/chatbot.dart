import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heritage_app/model/chatbot/message.dart';
import 'package:heritage_app/widget/messages/chatbot_homescreen.dart';
import 'package:heritage_app/widget/messages/message_bubble.dart';
import 'package:http/http.dart' as http;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _message = TextEditingController();
  List<Message> allMessages = [];

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  void sendMessage(String inputMessage) {
    Message msg1 = Message(msg: inputMessage, isMe: true, isLoaging: false);
    Message msg2 = Message(msg: "", isMe: false, isLoaging: true);
    setState(() {
      allMessages.insert(0, msg1);
      allMessages.insert(0, msg2);
    });
    postMessage(inputMessage);
  }

  void postMessage(String inputMessage) async {
    String apiKey = "AIzaSyBDQCoP0fsI9QdpbODaPnRHv_8_OeYsGZc";

    // METHOD 1
    // final String url =
    //     "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey";
    // Uri uri = Uri.parse(url);

    //METHOD 2
    final url = Uri.https(
      "generativelanguage.googleapis.com",
      "/v1beta/models/gemini-1.5-flash:generateContent",
      {
        "key": apiKey,
      },
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": inputMessage}
            ]
          }
        ]
      }),
    );

    final data = json.decode(response.body);
    String outputText = data['candidates'][0]['content']['parts'][0]['text'];

    Message msg = Message(msg: outputText, isMe: false, isLoaging: false);
    setState(() {
      allMessages.removeAt(0);
      allMessages.insert(0, msg);
    });
    // print(ans);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CHATBOT",
          style: TextStyle(
            fontFamily: 'Georgia',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, size: 28),
          ),
        ],
      ),
      body: Column(
        children: [
          // Main chat area
          Expanded(
            child: allMessages.isEmpty
                ? Center(child: ChatbotHomescreen())
                : ListView.builder(
                    reverse: true,
                    itemCount: allMessages.length,
                    itemBuilder: (ctx, idx) =>
                        MessageBubble(message: allMessages[idx]),
                  ),
          ),
          // Input field always at the bottom
          Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _message,
                    decoration: InputDecoration(
                      hintText: 'Enter Message',
                      prefixIcon: const Icon(Icons.upload_file),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (_message.text.trim().isNotEmpty) {
                            sendMessage(_message.text.trim());
                            _message.clear();
                          }
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
