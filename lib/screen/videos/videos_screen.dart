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
import 'package:gooto/services/service/firestore_service.dart';
import 'package:gooto/utils/MyStyle.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  final String url;
  const VideoApp({super.key, required this.url});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // FirestoreService instance
  final FirestoreService _firestoreService = FirestoreService();

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
              "This Month Videos",
              style: MyStyle.dashTextStyle.copyWith(
                fontSize: ScreenUtil().setSp(18),
                fontFamily: "arial",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: StreamBuilder<List<VideoModel>>(
          stream: _firestoreService.getVideos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("#############|ERROR->|##");
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final videos = snapshot.data ?? [];
            // print("======> data");
            // print(videos.first.name);
            // print(videos.first.url);

            return Container(
              child: Stack(
                children: [
                  SizedBox(height: 12.h),
                  //We need swiper for every content

                  Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return videos.isEmpty
                          ? CircularProgressIndicator()
                          // : VideoApp(url: videos.first.url!);
                          : ContentScreen(
                              src: videos[index].url!,
                              slide: videos[index].name,
                            );
                    },
                    itemCount: videos.length,
                    scrollDirection: Axis.vertical,
                  ),
                ],
              ),
            );
          },
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
      url:
          'https://firebasestorage.googleapis.com/v0/b/gooto-80b74.appspot.com/o/Dakhla.mp4?alt=media&token=fb666e29-5824-4d8d-84c8-b5f978236d75',
    ),
    // VideoModel(
    //   id: 1,
    //   name: " MOROCCO TRAVEL DOCUMENTARY | The Grand Moroccan Roadtrip ",
    //   url: "assets/video/travelmoroco.mp4",
    // ),
    // VideoModel(
    //   id: 3,
    //   name:
    //       "The King of Moroccan Tagine Food 🇲🇦 Crazy Casablanca Food Tour!! ",
    //   url: "assets/video/tagine.mp4",
    // ),
    // VideoModel(
    //   id: 4,
    //   name: " We are off to a New Continent! (Ferry from Spain to Morocco) ",
    //   url: "assets/video/document.mp4",
    // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       "10 Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/10days.mp4",
    // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       "Beautiful Places to Visit in Dakhla 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/Dakhla.mp4",
    // ),
    // //   VideoModel(
    // //   id: 5,

    // //   name: "Beautiful Tagine in Morocco 🇲🇦 | Must See Morocco Travel Guide ",

    // //   url: "assets/video/agine.mp4",
    // // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       "Beautiful Places to Visit in casablanca 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/casablanca.mp4",
    // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       "Beautiful Places to Visit in Marrakech 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/Marrakech.mp4",
    // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       "Beautiful Places to Visit in Marzouga 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/Marzouga.mp4",
    // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       " Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/Lharba.mp4",
    // ),
    // VideoModel(
    //   id: 5,
    //   name:
    //       "Beautiful Places to Visit in Essaouira 🇲🇦 | Must See Morocco Travel Guide ",
    //   url: "assets/video/Essaouira.mp4",
    // ),
  ];
}
