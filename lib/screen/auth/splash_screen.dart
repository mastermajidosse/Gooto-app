// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// // import 'package:internet_connection_checker/internet_connection_checker/art';
// import 'package:gooto/bloc/feed/feed_cubit.dart';
// import 'package:gooto/utils/MyStyle.dart';

// class SplashScreencreen extends StatefulWidget {
//   static const routeName = 'Splash';

//   const SplashScreencreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreencreenState createState() => _SplashScreencreenState();
// }

// class _SplashScreencreenState extends State<SplashScreencreen> {
//   @override
//   void initState() {
//     // gettt(context);

//     super.initState();
//   }

//   gettt(context) async {
//     Future.delayed((Duration(seconds: 10)))
//         .then((value) => Navigator.pushReplacementNamed(context, BottomTabBarr.routeName));
//     // bool result = await InternetConnectionChecker().hasConnection;
//     // if (result == true) {
//     //   BlocProvider.of<FeedCubit>(context).topPosts().then((value) {
//     //     print("delayed,,,,,,");
//     //     Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
//     //   }).timeout((Duration(seconds: 10)), onTimeout: () {
//     //     print("delayed,,,,,,");
//     //     Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
//     //   });
//     // } else {
//     //   print('No internet :( Reason:');
//     //   print(InternetConnectionChecker().connectionStatus);
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         image: DecorationImage(
//                           image: AssetImage("assets/icon.png"),
//                           fit: BoxFit.cover,
//                         )),
//                   ),
//                 ],
//               ),
//               MyStyle.loadingWidget3(colo: Colors.white)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:gooto/screen/bottom_tab.dart';

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

  @override
  void initState() {
    super.initState();
    radius = widget.radius;
    dotRadius = widget.dotRadius;

    if (widget.radius != 50.5)
      Future.delayed(Duration(seconds: 5)).then((_) {
        // Navigator.pushReplacementNamed(context, LoginPage.routeName);
        Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
        // BlocProvider.of<SystemsCubit>(context).clear(context);

        // BlocProvider.of<SystemsCubit>(context).initiateit(context);
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
                    // Transform.translate(
                    //   child: Dot(
                    //     radius: dotRadius,
                    //     color: Colors.redAccent,
                    //   ),
                    //   offset: Offset(
                    //     radius * cos(0.0 + 4 * pi / 4),
                    //     radius * sin(0.0 + 4 * pi / 4),
                    //   ),
                    // ),
                    // Transform.translate(
                    //   child: Dot(
                    //     radius: dotRadius,
                    //     color: Colors.lightGreen,
                    //   ),
                    //   offset: Offset(
                    //     radius * cos(0.0 + 5 * pi / 4),
                    //     radius * sin(0.0 + 5 * pi / 4),
                    //   ),
                    // ),
                    // Transform.translate(
                    //   child: Dot(
                    //     radius: dotRadius,
                    //     color: Colors.orangeAccent,
                    //   ),
                    //   offset: Offset(
                    //     radius * cos(0.0 + 6 * pi / 4),
                    //     radius * sin(0.0 + 6 * pi / 4),
                    //   ),
                    // ),
                    // Transform.translate(
                    //   child: Dot(
                    //     radius: dotRadius,
                    //     color: Colors.blueAccent,
                    //   ),
                    //   offset: Offset(
                    //     radius * cos(0.0 + 7 * pi / 4),
                    //     radius * sin(0.0 + 7 * pi / 4),
                    //   ),
                    // ),
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
