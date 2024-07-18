import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gooto/screen/videos/screens/content_screen.dart';



class HomePage extends StatelessWidget {
  final List<String> videos = [
    'assets/vedio/akchoure.mp4',
    'assets/vedio/Essaouira.mp4',
    'assets/vedio/Lharba.mp4',
    'assets/vedio/Marzouga.mp4',
    'assets/vedio/Taghazoute2.mp4',
  

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              //We need swiper for every content
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ContentScreen(
                    src: videos[index],
                    
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
