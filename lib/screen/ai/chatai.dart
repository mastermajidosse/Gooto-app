// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:gooto/main_dev.dart';

// class Chatai extends StatefulWidget {
//  Chatai({super.key});

//   @override
//   State<Chatai> createState() => _ChataiState();
// }

// class _ChataiState extends State<Chatai> {
//   @override
//   void initState() {
//     chatai();
//     super.initState();
//   }
//   void chatai()async{
//       final chat = model.startChat(history: [
//     Content.text('Hello, I have 2 dogs in my house.'),
//     Content.model([TextPart('Great to meet you. What would you like to know?')])
//   ]);
//   var content = Content.text('How many paws are in my house?');
//   var response = await chat.sendMessage(content);
//   print(response.text);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/main_dev.dart';
import 'package:markdown_widget/widget/markdown_block.dart';

class ChatAIScreen extends StatefulWidget {
  @override
  _ChatAIScreenState createState() => _ChatAIScreenState();
}

class _ChatAIScreenState extends State<ChatAIScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];


  @override
  void initState() {
    super.initState();
  
    _startChat();
  }

  void _startChat() async {
    final chat = model.startChat(history: [
    Content.text("you're a moroccan guide, if user asks you about anything related to morocco culture monument or Moroccan food or clothes answer as expert guide for morocco"),

    ]);

    // _addMessage(
    //   ChatMessage(
    //     text: 'How many paws are in my house?',
    //     isUserMessage: true,
    //   ),
    // );

    final response = await chat.sendMessage(Content.text('present yourself'));
    _addMessage(
      ChatMessage(
        text: response.text!,
        isUserMessage: false,
      ),
    );
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.add(message);
    });
  }

  void _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      _addMessage(
        ChatMessage(
          text: text,
          isUserMessage: true,
        ),
      );

      final chat = model.startChat(history: _messages.map((m) => m.toContent()).toList());
      final response = await chat.sendMessage(Content.text(text));
      _addMessage(
        ChatMessage(
          text: response.text!,
          isUserMessage: false,
        ),
      );

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ChatAI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: message.isUserMessage ? Colors.blue[300] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child:SingleChildScrollView(child: MarkdownBlock(data: message.text))
                    //Text(message.text),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
  });

  Content toContent() {
    return isUserMessage
        ? Content.text(text)
        : Content.model([TextPart(text)]);
  }
}