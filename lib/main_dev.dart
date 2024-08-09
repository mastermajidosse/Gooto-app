import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/services/app_config.dart';
import 'main.dart';
import 'package:flutter/services.dart';

// import 'package:awesome_notifications/awesome_notifications.dart';
late List<CameraDescription> cameras;
late final GenerativeModel model;
late dynamic response;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  AppConfig.env = Environment.DEV;

  runApp(MyApp("dev"));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
