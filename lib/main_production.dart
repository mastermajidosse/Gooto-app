import 'package:flutter/material.dart';
import 'package:gooto/services/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//late List<CameraDescription> cameras;
//late final GenerativeModel model;
//late dynamic response;
// int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  AppConfig.env = Environment.PROD;

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
