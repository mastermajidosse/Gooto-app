import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/main_dev.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/utils/mystyle.dart';
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


String getCurrentTime() {
  final now = DateTime.now();
  return "${now.hour % 12 == 0 ? 12 : now.hour % 12}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
}

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
          "you're a moroccan guide, if user asks you about anything related to morocco culture monument or Moroccan food or clothes or transport answer as expert guide for morocco and use google and  talk a short answer with user"),
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
          backgroundColor: Colors.white,
          title: Row(
            children: [
               Stack(
                alignment: Alignment.center,
                children: [
                  // Outer circle for border
                  Container(
                    width: 55, // Adjust size as needed
                    height: 55, // Adjust size as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent, // Background color of the border
                      border: Border.all(color: Colors.green, width: 1), // Border properties
                    ),
                  ),
                  // Inner CircleAvatar
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/avatar.jpeg'),
                    child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
                     
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Moroccan AI Guide",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "Online",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              // CircleAvatar(
              //   radius: 25,
              //   backgroundImage: AssetImage('assets/avatar.jpeg'), // Replace with your image asset
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: Container(
              //       width: 10,
              //       height: 10,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.green,
              //         border: Border.all(color: Colors.white, width: 2),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(width: 10),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Morocan AI Guide",
              //       style: TextStyle(color: Colors.black, fontSize: 20),
              //     ),
              //     Text(
              //       "Online",
              //       style: TextStyle(color: Colors.black, fontSize: 14),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      //  AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text('Morocan AI Guide'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: 
            ListView.builder(
  controller: _scrollController,
  itemCount: _messages.length,
  itemBuilder: (context, index) {
    final message = _messages[index];
    return Align(
      alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: message.isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children:<Widget> [
          if (!message.isUserMessage)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.jpeg'), // Profile image
                ),
                SizedBox(height: 4), // Space between avatar and message
              ],
            ),
          SizedBox(width: 8), 

          Container(
            constraints: BoxConstraints(maxWidth: 300), 
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
            decoration: BoxDecoration(
              color: message.isUserMessage ? Colors.blue[200] : Colors.grey[300],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: message.isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                // Display message text
                message.text.isEmpty
                    ? CircularProgressIndicator()
                    : SingleChildScrollView(child: MarkdownBlock(data: message.text)),
                SizedBox(height: 5), // Space between message and time
                Text(
                 getCurrentTime(), // Display message timestamp
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
)
            // ListView.builder(
            //   controller: _scrollController,
            //   itemCount: _messages.length,
            //   itemBuilder: (context, index) {
            //     final message = _messages[index];
            //     return Align(
            //         alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            //         child: Row(
            //           mainAxisAlignment:
            //               message.isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            //           children: [
            //             if (!message.isUserMessage)
            //               CircleAvatar(
            //                 backgroundImage: AssetImage('assets/avatar.jpeg'),
            //               ),
            //             Container(
            //                 width: 320.w,
            //                 padding: EdgeInsets.all(6),
            //                 margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
            //                 decoration: BoxDecoration(
            //                   color: message.isUserMessage ? Colors.blue[300] : Colors.grey[300],
            //                   borderRadius: BorderRadius.circular(16.0),
            //                 ),
            //                 child: message == ""
            //                     ? CircularProgressIndicator()
            //                     : SingleChildScrollView(child: MarkdownBlock(data: message.text))

            //                 //Text(message.text),
            //                 ),
            //           ],
            //         ));
            //   },
            // ),
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
                      hintText: 'ask about anything in morocco...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(icon:Icon(IconData(0xe571, fontFamily: 'MaterialIcons', matchTextDirection: true),color: MyStyle.primarycolo,),onPressed: _sendMessage,)
                  //Text('Send'),
                
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
