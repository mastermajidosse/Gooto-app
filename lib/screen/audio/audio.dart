// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

class AudioPlayerScreen extends StatefulWidget {
  List<String> listphoto;
  String text;
  String audio;
  List<String> listdesc;
  AudioPlayerScreen(this.listphoto, this.text, this.audio, this.listdesc);
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  // List<String> listphoto=["assets/sTaiwnMc.jpeg","assets/icone.png","assets/sTaiwnMc.jpeg"];
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String FormatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(d.inHours);
    final minute = twoDigits(d.inMinutes.remainder(60));
    final seconde = twoDigits(d.inSeconds.remainder(60));
    return [if (d.inHours > 0) hours, minute, seconde].join(':');
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newduration) {
      setState(() {
        duration = newduration;
      });
    });
    audioPlayer.onPositionChanged.listen((newpostion) {
      setState(() {
        position = newpostion;
      });
    });

    setupAudio();
    print("format${FormatTime(duration - position)}");
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future setupAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load(widget.audio);
    audioPlayer.setSourceUrl(
      url.path,
    );
  }
//  void _setupAudio() {
//   _assetsAudioPlayer.open(
//     Audio("assets/audio/keep_connected.mp3"),
//     autoStart: false,
//     showNotification: true,
//   );

//   _assetsAudioPlayer.currentPosition.listen((position) {
//     setState(() {
//       _currentAudioPosition = position.inSeconds;
//     });
//   });

//   _assetsAudioPlayer.current.listen((current) {
//     setState(() {
//       _currentAudioDuration = current?.value?.audio.duration?.inSeconds ?? 0;
//     });
//   });
// }

//   void _playPause() {
//     if (_assetsAudioPlayer.isPlaying.value) {
//       _assetsAudioPlayer.pause();
//     } else {
//       _assetsAudioPlayer.play();
//     }
//   }
  Widget PlaceCard(String img) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                img,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(0),
                child: CarouselSlider(
                  items: widget.listphoto.map((e) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Image.asset(
                              e,
                              width: double.infinity,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 12,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                )
                //   CarouselSlider(

                //     items: [1,2,3,4].map((e){
                //       return  ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Image.asset("assets/sTaiwnMc.jpeg"
                //   ,width: double.infinity,
                //   height: 350,
                //   fit: BoxFit.cover,),
                // );

                //     }).toList(),
                //     options:
                //      CarouselOptions(height: 200),
                //   )
                //  MasonryGridView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   primary: false,
                //    // scrollDirection: Axis.horizontal,
                //   gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 1,
                //   ),
                //   itemCount: listphoto.length,
                //   itemBuilder: (context, index) {
                //     final img=listphoto[index];
                //     //final CardModule card = _filteredItems[index];
                //     return PlaceCard(img);
                //   },
                // ),
                ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Create by GOOTO',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              items: widget.listdesc.map((e) {
                return Container(
                  width: 100,
                  height: 150,
                  color: Colors.transparent,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            e,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Image.asset(
                        //   e,
                        //   width: double.infinity,
                        //   height: 350,
                        //   fit: BoxFit.cover,
                        // ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 12,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: isPlaying,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 10000),
                viewportFraction: 0.8,
                scrollDirection: Axis.vertical,
              ),
            ),
            Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                activeColor: Colors.black, // Set the active color
                inactiveColor: Colors.grey.withOpacity(0.5), // Set the inactive color
                thumbColor: Colors.black,
                onChanged: (value) async {
                  final postion = Duration(seconds: value.toInt());
                  await audioPlayer.seek(postion);
                  await audioPlayer.resume();
                  print("position:${position}");
                  print("duration:${duration}");
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(FormatTime(position)),
                  //SizedBox(width: 250,),

                  Text(FormatTime(duration - position)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.withOpacity(0.3),
              ),

              width: double.infinity,
              height: 60,
              //color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.repeat_outlined,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () async {
                        //       final newDuration = duration + Duration(seconds: 10);
                        //       final newpostion =position+Duration(seconds: 10);
                        // setState(() {
                        //   duration = newDuration;
                        //   position=newpostion;

                        // });
                        // await audioPlayer.seek(position);
                        // await audioPlayer.resume();
                        //await audioPlayer.seek(newDuration);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.forward_10,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () async {
                        final newDuration = duration + Duration(seconds: 10);
                        final newpostion = position + Duration(seconds: 10);
                        setState(() {
                          duration = newDuration;
                          position = newpostion;
                        });
                        await audioPlayer.seek(position);
                        await audioPlayer.resume();
                        //await audioPlayer.seek(newDuration);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_outline : Icons.play_arrow_outlined,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.replay_10,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () async {
                        final newDuration = duration - Duration(seconds: 10);
                        final newpostion = position - Duration(seconds: 10);
                        setState(() {
                          duration = newDuration;
                          position = newpostion;
                        });
                        await audioPlayer.seek(position);
                        await audioPlayer.resume();
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.brightness_2,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () async {
                        //       final newDuration = duration + Duration(seconds: 10);
                        //       final newpostion =position+Duration(seconds: 10);
                        // setState(() {
                        //   duration = newDuration;
                        //   position=newpostion;

                        // });
                        // await audioPlayer.seek(position);
                        // await audioPlayer.resume();
                        //await audioPlayer.seek(newDuration);
                      },
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
