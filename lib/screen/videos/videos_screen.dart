import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gooto/bloc/feed/feed_cubit.dart';
import 'package:gooto/models/video_model.dart';
import 'package:gooto/screen/videos/screens/content_screen.dart';
import 'package:gooto/screen/videos/screens/home_page.dart';
import 'package:gooto/screen/videos/video_more.dart';
import 'package:gooto/utils/MyStyle.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  //  final List<String> videos = [
  //   'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  // ];
    final List<String> videos = [
    'assets/vedio/akchoure.mp4',
    'assets/vedio/travelmoroco.mp4',
    'assets/vedio/Essaouira.mp4',
    'assets/vedio/Lharba.mp4',
    'assets/vedio/Marzouga.mp4',
    'assets/vedio/Taghazoute2.mp4',
    
    'assets/vedio/casablanca.mp4',
    'assets/vedio/document.mp4',
    'assets/vedio/10days.mp4',
    "assets/vedio/Dakhla"
        "assets/vedio/Tagine.mp4",
    "assets/vedio/Marrakech.mp4" 
  ];

  
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 174, 113),
            ),
            height: 30.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "This Week Videos",
              style: MyStyle.dashTextStyle.copyWith(
                fontSize: ScreenUtil().setSp(18),
                fontFamily: "arial",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body:
      Container(
          child: Stack(
            children: [
  //               SizedBox(height: 12.h),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 16),
  //             child: Center(
  //               child: Text(
  //               "This Week Videos",
  //               style:TextStyle(
  //   color: Colors.white,
  //   fontWeight: FontWeight.bold,
  //   fontSize: ScreenUtil().setSp(20),
  // )
  //             ), 
              
  //             )
             
  //           ),
            SizedBox(height: 12.h),
              //We need swiper for every content
             
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                 // int randomIndex = Random().nextInt(videoss!.length);
             //  videoss?.shuffle();
                  return ContentScreen(
                    src: videoss![index].url,
                    slide: videoss![index].name,
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
          
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     "المغرب",
            //     style: MyStyle.dash13TextStyle,
            //   ),
            // ),
            // VideoDetails(),
            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   primary: true,
            //   itemCount: videos!.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return OneVid(videos![index]);
            //   },
            // ),
            //SizedBox(height: 16),
            //HomePage()
       
        // ),
      ),
    );
  }

  List<VideoModel>? videoss = [
    VideoModel(
      id: 1,

      name: " I Can't Believe This Happened To Me in Akchour ",
      url: 'assets/vedio/akchoure.mp4',
    ),
    VideoModel(
      id: 1,
     
      name: " MOROCCO TRAVEL DOCUMENTARY | The Grand Moroccan Roadtrip ",
   
      url: "assets/vedio/travelmoroco.mp4",
    ),
    VideoModel(
      id: 3,

      name: "The King of Moroccan Tagine Food 🇲🇦 Crazy Casablanca Food Tour!! ",

      url: "assets/vedio/tagine.mp4",
    ),
    VideoModel(
      id: 4,

      name: " We are off to a New Continent! (Ferry from Spain to Morocco) ",
     
      url: "assets/vedio/document.mp4",
    ),
    VideoModel(
      id: 5,

      name: "10 Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/10days.mp4",
    ),
      VideoModel(
      id: 5,

      name: "Beautiful Places to Visit in Dakhla 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/Dakhla.mp4",
    ),
    //   VideoModel(
    //   id: 5,

    //   name: "Beautiful Tagine in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
   
    //   url: "assets/vedio/agine.mp4",
    // ),
      VideoModel(
      id: 5,

      name: "Beautiful Places to Visit in casablanca 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/casablanca.mp4",
    ),
      VideoModel(
      id: 5,

      name: "Beautiful Places to Visit in Marrakech 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/Marrakech.mp4",
    ),
      VideoModel(
      id: 5,

      name: "Beautiful Places to Visit in Marzouga 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/Marzouga.mp4",
    ),
      VideoModel(
      id: 5,

      name: " Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/Lharba.mp4",
    ),
      VideoModel(
      id: 5,

      name: "Beautiful Places to Visit in Essaouira 🇲🇦 | Must See Morocco Travel Guide ",
   
      url: "assets/vedio/Essaouira.mp4",
    ),
  ];
}
