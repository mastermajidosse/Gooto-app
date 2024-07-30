import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gooto/screen/ai/const.dart';

class AiChat extends StatefulWidget {
  const AiChat();


  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> {
  
  Gemini gemini = Gemini.instance;

  final ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'User',
  );

  final ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'Gemini',
  );

  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chat'),
      ),
      body: buildUI(),
    );
  }

  Widget buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: sendMessage,
      messages: messages,
    );
  }

  void sendMessage(ChatMessage chatMessage) async {
    setState(() {
      messages.insert(0, chatMessage);
    });
    try{

    
    final jsonData = await loadJsonData('assets/plage1.json');
      final prompt = createPrompt(chatMessage.text, jsonData);

      // Query Gemini
      final responseStream = gemini.streamGenerateContent(prompt);
    responseStream.listen((event) {
  if (messages.first.user.id == geminiUser.id) {
    setState(() {
      messages.first.text += event.content!.parts!.fold(
        '',
        (previousValue, element) => previousValue + element.toString()
      );
    });
  } else {
    String messageText = event.content!.parts!.fold(
      '',
      (previousValue, element) => previousValue + element.toString()
    );

    // Check if the message contains the symbol to be removed
    if (messageText.contains('*')) {
      // Remove the symbol from the message
      messageText = messageText.replaceAll('*', '');

      // Inform the user about removing the symbol
      setState(() {
        messages.insert(0, ChatMessage(
          text: '',
          user: currentUser,
          createdAt: DateTime.now(),
        ));
      });
    }

    // Check if the message contains the request to learn the link of the image
    if (messageText.contains('link of the image')) {
      // Provide the link of the image to the user
      String imageUrl = 'https://example.com/image.jpg'; // Replace with the actual image link
      setState(() {
        messages.insert(0, ChatMessage(
          text: 'The link of the image is: $imageUrl',
          user: currentUser,
          createdAt: DateTime.now(),
        ));
      });
    }

    setState(() {
      messages.insert(0, ChatMessage(
        text: messageText,
        user: geminiUser,
        createdAt: DateTime.now(),
      ));
    });
  }
    
});
    }catch(error) {
      print("Error in streaming response: $error");
    }
    }

    // try {
    //   // Load JSON data
    //   final jsonData = await loadJsonData('assets/plage1.json');
    //   final prompt = createPrompt(chatMessage.text, jsonData);

    //   // Query Gemini
    //   final responseStream = gemini.streamGenerateContent(prompt);

    //   responseStream.listen((event) {
    //     if (messages.first.user.id == geminiUser.id) {
    //       setState(() {
    //         messages.first.text += event.content!.parts!.fold(
    //           '',
    //           (previousValue, element) => previousValue + element.toString()
    //         );
    //       });
    //     } else {
    //       setState(() {
    //         messages.insert(0, ChatMessage(
    //           text: event.content!.parts!.fold(
    //             '',
    //             (previousValue, element) => previousValue + element.toString()
    //           ),
    //           user: geminiUser,
    //           createdAt: DateTime.now(),
    //         ));
    //       });
    //     }
    //   });
    // } catch (error) {
    //   print("Error in streaming response: $error");
    // }
  }

  // Future<Map<String, dynamic>> loadJsonData(String filePath) async {
  //   final file = File(filePath);
  //   final contents = await file.readAsString();
  //   if (contents.trim().isEmpty) {
  //     throw Exception("The JSON file is empty.");
  //   }
  //   return json.decode(contents);
  // }
  Future<Map<String, dynamic>> loadJsonData(String filePath) async {
  final jsonString = await rootBundle.loadString(filePath);

  if (jsonString.trim().isEmpty) {
    throw Exception("The JSON file is empty.");
  }

  return json.decode(jsonString);
}

  String createPrompt(String userQuery, Map<String, dynamic> data) {
    return """
    Voici les informations disponibles:
    les vetement marrocain et les photos:
    ${json.encode(data['morrocan_mens_clothes_and_images'])}
    
    Plages:
    ${json.encode(data['plages'])}
    
    Lieux populaires au Maroc:
    ${json.encode(data['popular_destination_in_morocco_et_leur_image'])}
    
    Répondez uniquement à la demande suivante en utilisant les informations et affiche les images de chaque reponse:
    $userQuery
    """;
  }
