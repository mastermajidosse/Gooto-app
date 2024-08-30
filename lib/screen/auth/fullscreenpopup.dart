import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gooto/models/hotel_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenPop extends StatelessWidget {
  HotelModel hotel;
  FullScreenPop({super.key, required this.hotel});

  List<Color> colors = [
    Color.fromARGB(255, 21, 161, 149),
    Color.fromARGB(255, 161, 21, 54),
    Color.fromARGB(255, 185, 182, 38),
    Color.fromARGB(255, 185, 38, 129),
    Color.fromARGB(255, 168, 38, 185),
    Color.fromARGB(255, 38, 185, 92),
  ];

  Color getColor() {
    int randIndex = Random().nextInt(colors.length);
    return colors[randIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(hotel.img),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
      ),
      Positioned(
        top: 50,
        left: 20,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text(
                "Amazing Hotel".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Text(
                hotel.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: InkWell(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(hotel.url))) {
                    throw Exception('Could not launch ${hotel.url}');
                  }
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: getColor(),
                  ),
                  width: 350,
                  height: 45,
                  alignment: Alignment.center,
                  child: Text(
                    "Book Now".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 38),
          ],
        ),
      ),
    ],
  ),
);
      // Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: NetworkImage(hotel.img),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   height: double.infinity,
      //   width: double.infinity,
        
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 26.0),
      //         child: Text(
      //           "Amazing Hotel",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.normal,
      //             fontSize: 23,
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 26.0),
      //         child: Text(
      //           hotel.title,
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 36,
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 50),
      //       Center(
      //         child: InkWell(
      //           onTap: () async {
      //             if (!await launchUrl(Uri.parse(hotel.url))) {
      //               throw Exception('Could not launch ${hotel.url}');
      //             }
      //           },
      //           splashColor: Colors.transparent,
      //           highlightColor: Colors.transparent,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(15),
      //               color: getColor(),
      //             ),
      //             width: 350,
      //             height: 45,
      //             alignment: Alignment.center,
      //             child: Text(
      //               "Book Now",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 16,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 38),
      //     ],
      //   ),
      // ),
   // );
  }
}
// appBar: AppBar(
      //   title: Align(
      //     alignment: Alignment.center,
      //     child: 
      //   Text(hotel.title,textAlign: TextAlign.center,),)
        
      // ),