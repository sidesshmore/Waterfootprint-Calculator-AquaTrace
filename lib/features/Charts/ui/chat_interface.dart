import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatInterface extends StatefulWidget {
  const ChatInterface({super.key});

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  ChatUser sidessh = ChatUser(id: '1', firstName: 'Sidessh');
  ChatUser aquaBot = ChatUser(
      id: '2', firstName: 'Aqua Bot', profileImage: 'assets/avatar.png');

  List<ChatMessage> messageList = [];
  List<ChatUser> typingAnimation = [];

  final myURL =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${dotenv.env["GEMINI_API"]}';

  final header = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typingAnimation.add(aquaBot);
    messageList.insert(0, m);
    setState(() {});

    var textData = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(myURL), headers: header, body: jsonEncode(textData))
        .then((value) {
      if (value.statusCode == 200) {
        var resultResponse = jsonDecode(value.body);
        print(resultResponse['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage responseMessage = ChatMessage(
            text: resultResponse['candidates'][0]['content']['parts'][0]
                ['text'],
            user: aquaBot,
            createdAt: DateTime.now());

        messageList.insert(0, responseMessage);
      } else {
        print('Error');
      }
    }).catchError((e) {});

    typingAnimation.remove(aquaBot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: height * 0.8,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    child: Image(
                      image: AssetImage('assets/avatar.png'),
                    ),
                  ),
                  const Text(
                    'Aqua Bot',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    color: Colors.red,
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: DashChat(
                        typingUsers: typingAnimation,
                        currentUser: sidessh,
                        onSend: (ChatMessage m) {
                          getData(m);
                        },
                        messages: messageList),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
