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

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();

  // FirestoreService instance
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    List<VideoModel> videos = _firestoreService.getVideos();
    return SafeArea(
      child: Scaffold(
          // key: scaffoldKey,
          backgroundColor: Colors.black,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
            child: Container(
              color: const Color.fromARGB(255, 56, 55, 55),
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
          body: Container(
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
          )
          // ----------- for firebase store --------------
          // body: StreamBuilder<List<VideoModel>>(
          //   stream: _firestoreService.getVideos(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       print("#############|ERROR->|##");
          //       return Center(child: Text('Error: ${snapshot.error}'));
          //     }
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     }

          //     final videos = snapshot.data ?? [];

          //     return Container(
          //       child: Stack(
          //         children: [
          //           SizedBox(height: 12.h),
          //           //We need swiper for every content

          //           Swiper(
          //             itemBuilder: (BuildContext context, int index) {
          //               return videos.isEmpty
          //                   ? CircularProgressIndicator()
          //                   // : VideoApp(url: videos.first.url!);
          //                   : ContentScreen(
          //                       src: videos[index].url!,
          //                       slide: videos[index].name,
          //                     );
          //             },
          //             itemCount: videos.length,
          //             scrollDirection: Axis.vertical,
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),

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
}
