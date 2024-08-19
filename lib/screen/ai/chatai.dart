import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/main_dev.dart';
import 'package:markdown_widget/widget/markdown_block.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatAIScreen extends StatefulWidget {
  @override
  _ChatAIScreenState createState() => _ChatAIScreenState();
}

class _ChatAIScreenState extends State<ChatAIScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
     bool isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _startChat();
        setState(() {
      isLoading = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startChat() async {
    final chat = model.startChat(history: [
      Content.text(
          "you're a moroccan guide, if user asks you about anything related to morocco culture monument or Moroccan food or clothes or transport answer as expert guide for morocco and use google "),
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
    FocusScope.of(context).unfocus();
    _messageController.clear();
    setState(() {
      _messages.add(message);
        isLoading = false;
          _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
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
        setState(() {
        isLoading = true;
      });
      final response = await chat.sendMessage(Content.text(text));
      _addMessage(
        ChatMessage(
          text: response.text!,
          isUserMessage: false,
        ),
      );
      FocusScope.of(context).unfocus();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Morocan AI Guide'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                    alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment:
                          message.isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!message.isUserMessage)
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.jpeg'),
                          ),
                        Container(
                            width: 320.w,
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              color: message.isUserMessage ? Colors.blue[300] : Colors.grey[300],
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: message == ""
                                ? CircularProgressIndicator()
                                : SingleChildScrollView(child: MarkdownBlock(data: message.text))

                            //Text(message.text),
                            ),
                      ],
                    ));
              },
            ),
          ),
           isLoading
              ? Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Container(
                      width: 30.r,
                      height: 30.r,
                      child: CircularProgressIndicator()),
                )
              : SizedBox(),
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
        : Content.model(
            [TextPart(text)],
          );
  }
}
