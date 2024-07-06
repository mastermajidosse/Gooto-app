import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gooto/bloc/feed/feed_cubit.dart';
import 'package:gooto/models/video_model.dart';
import 'package:gooto/screen/videos/video_more.dart';
import 'package:gooto/utils/MyStyle.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF008aae),
            ),
            height: 60.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Videos",
              style: MyStyle.dashTextStyle.copyWith(
                fontSize: ScreenUtil().setSp(18),
                fontFamily: "arial",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "This Week Videos",
                style: MyStyle.subtitleTextStyle,
              ),
            ),
            SizedBox(height: 12.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     "المغرب",
            //     style: MyStyle.dash13TextStyle,
            //   ),
            // ),
            // VideoDetails(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              itemCount: videos!.length,
              itemBuilder: (BuildContext context, int index) {
                return OneVid(videos![index]);
              },
            ),
            SizedBox(height: 16),
          ],
        ),
        // ),
      ),
    );
  }

  List<VideoModel>? videos = [
    VideoModel(
      id: 1,
      channelImg:
          "https://yt3.ggpht.com/tzio1KXXxly4DP9BRmiwZaU2MQy5iCgbOwL0DcgLkrG4ZbWK5Z7JDgkqg9WpRu79yiEUWfn9eyc=s88-c-k-c0x00ffffff-no-rj",
      name: " I Can't Believe This Happened To Me in Morocco (Shocked) ",
      channelName: "More Kenny",
      url: "https://youtu.be/ue1VwEZvQHQ",
    ),
    VideoModel(
      id: 1,
      channelImg:
          "https://yt3.ggpht.com/JG3fCUW0JA7Kzw5kvFJQjD6L-Awzd7o335X5yDzcuxsrgSY1Ppw6vz_FmMzy0JCNIy0jRXXqRtQ=s88-c-k-c0x00ffffff-no-rj",
      name: " MOROCCO TRAVEL DOCUMENTARY | The Grand Moroccan Roadtrip ",
      channelName: "Lucas T jahn",
      url: "https://youtu.be/FFyaqbAn-cA",
    ),
    VideoModel(
      id: 3,
      channelImg:
          "https://yt3.ggpht.com/kXn5Ebjvia9adabHc7xyDuH46u5yR5dHXzfMqaXPANiFOumq0Vx3Q2fAmtvtBeID0cutBKdDzZM=s88-c-k-c0x00ffffff-no-rj",
      name: "The King of Moroccan Street Food 🇲🇦 Crazy Casablanca Food Tour!! ",
      channelName: "Bohemian Kitchen",
      url: "https://youtu.be/J4dzI-Yk9ok",
    ),
    VideoModel(
      id: 4,
      channelImg:
          "https://yt3.ggpht.com/J0nU49t0OW684dcdz4DO-oaanVAqR0qaS3N8QIThsR2AODPoYbj8lO4gYxPlYeN8FREi03ZCYQ=s88-c-k-c0x00ffffff-no-rj",
      name: " We are off to a New Continent! (Ferry from Spain to Morocco) ",
      channelName: "The Buddymoon",
      url: "https://youtu.be/_avcZBIfr6s",
    ),
    VideoModel(
      id: 5,
      channelImg:
          "https://yt3.ggpht.com/ytc/AIdro_lw8fvBaeIbYNuXAEWmVOMlxuMBBh6Es9pONrsGE0F_zaw=s88-c-k-c0x00ffffff-no-rj",
      name: " 10 Beautiful Places to Visit in Morocco 🇲🇦 | Must See Morocco Travel Guide ",
      channelName: "Lifestyle Hal",
      url: "https://youtu.be/HRzLiATNRNc",
    ),
  ];
}
