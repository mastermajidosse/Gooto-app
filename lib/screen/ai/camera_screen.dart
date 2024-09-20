import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/main_dev.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
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
    model: 'gemini-1.5-flash',
    apiKey: "AIzaSyBUePPrLujsYnIt4_6G9TYCQEL2YxrX2kg",
  );

  String res = "";

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();

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
    final prompt = TextPart(
        "Describe this monument historique from moroco tell all info builder and Year of construction and  inside this picture ");

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
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monument Historique'),
        automaticallyImplyLeading: false,
      ),
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            height: 500.h,
                            child: Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: MarkdownWidget(data: res),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Show description for this Monument ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
        ],
      ),
    );
  }
}
