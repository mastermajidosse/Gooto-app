import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/main_dev.dart';
import 'package:markdown_widget/widget/all.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final ValueNotifier<bool> _actionNotifier = ValueNotifier<bool>(true);
  final model = GenerativeModel(
    model: 'gemini-1.5-pro',
    apiKey: "AIzaSyDHRCG6Ig1LIn28lfRljDrdNZIHvF5a908",
  );

  String res = "";

  @override
  void initState() {
    super.initState();

    // }
//    void _showModal() {
//  showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: MediaQuery.of(context).viewInsets,
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             child: MarkdownWidget(data: res),
//           ),
//         );
//       },
//     );
//   }
//      void _handleActionChange() {
//     if (_actionNotifier.value == false) {
//       _showModal();
//     }

    _controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();

    // loadit();
    gobro();
  }

  gobro() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      print(timer.tick);
      timer.cancel;
      loadit();
    });
  }

  loadit() async {
    // const prompt = 'describe this picture';
    // final prompt = TextPart("Describe this picture");
    final prompt = TextPart(
        "Describe this monument historique from moroco tell all info builder and Year of construction and  inside this picture in your answer just give me 500 character");
    // final content = [Content.text(prompt)];
    // final response = await model.generateContent(content);
    // try {
try {
    await _initializeControllerFuture;

    if (_controller != null && _controller!.value.isInitialized) {
      final image = await _controller!.takePicture();

      final imageParts = [
        DataPart('image/jpeg', await image.readAsBytes()),
      ];

      final response = await model.generateContent([
        Content.multi([prompt, ...imageParts])
      ]);

      print("----------> response");
      print(response.text);
      setState(() {
        res = response.text ?? "";
      });
    }
  } catch (e) {
    if (e is CameraException) {
      // Handle the CameraException
      print('CameraException: $e');
    } else {
      // Handle other exceptions
      print('Exception: $e');
    }
  } finally {
    // Dispose the CameraController when done
    await _controller?.dispose();
  }
    // await _initializeControllerFuture;
    // final image = await _controller.takePicture();

    // final imageParts = [
    //   DataPart('image/jpeg', await image.readAsBytes()),
    // ];
    // final response = await model.generateContent([
    //   Content.multi([prompt, ...imageParts])
    // ]);
    // print("----------> response");
    // print(response.text);
    // setState(() {
    //   res = response.text ?? "";
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monument Historique')),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          res.isEmpty
              ? const SizedBox()
              : Container(
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    child: Text(
                      'Markdown Content',
                      style: const TextStyle(color: Colors.black),
                    ),
                    //MarkdownWidget(data: res)
                  ))
          //   ValueListenableBuilder<bool>(
          //   valueListenable: _actionNotifier,
          //   builder: (context, value, child) {
          //     return
          //     Switch(
          //       value: value,
          //       onChanged: (newValue) {
          //         _actionNotifier.value = newValue;
          //       },
          //     );
          //   },
          // ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.camera_alt),
      //   onPressed: () async {
      //     // try {
      //     //   await _initializeControllerFuture;
      //     //   final image = await _controller.takePicture();
      //     //   // Handle the captured image
      //     // } catch (e) {
      //     //   print(e);
      //     // }
      //     loadit();
      //   },
      // ),
    );
  }
}
