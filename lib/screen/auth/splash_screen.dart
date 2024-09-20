import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gooto/main_dev.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final GenerativeModel model;
late dynamic response;
late List<CameraDescription> cameras;

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';

  final double radius;
  final double dotRadius;

  SplashScreen({this.radius = 50.0, this.dotRadius = 10.0});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  late double radius;
  late double dotRadius;
  void initializegemini() async {
    model = GenerativeModel(
      model: 'gemini-1.5-flash',
    apiKey: "AIzaSyBUePPrLujsYnIt4_6G9TYCQEL2YxrX2kg",
    );
    final content = [
      Content.text(
          "you're a moroccan guide, if user asks you about anything related to morocco culture monument or Moroccan food or clothes answer as expert guide for morocco")
    ];
    response = await model.generateContent(content);
  }

  @override
  void initState() {
    super.initState();
    radius = widget.radius;
    dotRadius = widget.dotRadius;

    if (widget.radius != 50.5)
      Future.delayed(Duration(seconds: 5)).then((_) async {
        await availableCameras().then((value) {
          initializegemini();
          cameras = value;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomTabBarr()),
          );
        });
      });

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Container(
        width: 100,
        height: 100,
        child: Center(
          child: RotationTransition(
            turns: animation_rotation,
            child: Container(
              //color: Colors.limeAccent,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0.0, 0.0),
                      child: Dot(
                        radius: radius,
                        color: MyStyle.primarycolo,
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 0.8,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 0.5 * pi / 4),
                        radius * sin(0.0 + 0.5 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 0.9 * pi / 4),
                        radius * sin(0.0 + 0.9 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.2,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 1.3 * pi / 4),
                        radius * sin(0.0 + 1.3 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.4,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 1.7 * pi / 4),
                        radius * sin(0.0 + 1.7 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.6,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 2.2 * pi / 4),
                        radius * sin(0.0 + 2.2 * pi / 4),
                      ),
                    ),
                    // second

                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 0.8,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 3.3 * pi / 4),
                        radius * sin(0.0 + 3.3 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 3.7 * pi / 4),
                        radius * sin(0.0 + 3.7 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.2,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 4.1 * pi / 4),
                        radius * sin(0.0 + 4.1 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.4,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 4.5 * pi / 4),
                        radius * sin(0.0 + 4.5 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.6,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 5 * pi / 4),
                        radius * sin(0.0 + 5 * pi / 4),
                      ),
                    ),
//third
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 0.8,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 5.9 * pi / 4),
                        radius * sin(0.0 + 5.9 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 6.3 * pi / 4),
                        radius * sin(0.0 + 6.3 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.2,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 6.7 * pi / 4),
                        radius * sin(0.0 + 6.7 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.4,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 7.1 * pi / 4),
                        radius * sin(0.0 + 7.1 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius * 1.6,
                        color: MyStyle.secondarycolo,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 7.6 * pi / 4),
                        radius * sin(0.0 + 7.6 * pi / 4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius = 50, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
