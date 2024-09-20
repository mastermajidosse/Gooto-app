import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gooto/services/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

late List<CameraDescription> cameras;
// late final GenerativeModel model;
// late dynamic response;
// int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  AppConfig.env = Environment.PROD;

  // model =
  //     GenerativeModel(model: 'gemini-1.5-pro', apiKey: "AIzaSyBg1oUYaYkgffZSZKPCZcrBaL3H0vQkwXc");
  // final content = [
  //   Content.text(
  //       "you're a moroccan guide, if user asks you about anything related to morocco culture monument or Moroccan food or clothes answer as expert guide for morocco")
  // ];
  // //  response = await model.generateContent(content);
  //   model =
  //     GenerativeModel(model: 'gemini-1.5-pro', apiKey: "AIzaSyBg1oUYaYkgffZSZKPCZcrBaL3H0vQkwXc");
  // final content = [
  //   Content.text(
  //       "you're a moroccan guide, if user asks you about anything related to morocco culture monument or Moroccan food or clothes answer as expert guide for morocco")
  // ];
  // response = await model.generateContent(content);
  //response = await model.generateContent(content);
//print(response);
  // firsttime();

  runApp(MyApp("prod"));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
