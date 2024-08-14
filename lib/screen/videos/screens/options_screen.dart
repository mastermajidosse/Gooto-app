import 'package:flutter/material.dart';
import 'package:gooto/screen/videos/screens/shakewidget.dart';

class OptionsScreen extends StatelessWidget {
  final String titles;
  OptionsScreen({required this.titles});
  Widget modeText({required String title}) => Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 10,
          fontFamily: "Urbanist",
          color: Colors.white,
          fontStyle: FontStyle.normal,
          height: 0.8,
        ),
        overflow: TextOverflow.ellipsis,
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 150),
                  //SizedBox(height: 90),

                  Text(
                    titles,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      fontFamily: "Urbanist",
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      height: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
