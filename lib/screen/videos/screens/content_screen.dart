import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gooto/screen/videos/screens/like_icon.dart';
import 'package:gooto/screen/videos/screens/options_screen.dart';

import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;
 final String? slide;
  const ContentScreen({Key? key, this.src,this.slide}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }
  
  Future initializePlayer() async {
    try {
  _videoPlayerController = VideoPlayerController.asset(widget.src!);
  await _videoPlayerController.initialize();
  _chewieController = ChewieController(
    videoPlayerController: _videoPlayerController,
    autoPlay: true,
    showControls: false,
    looping: true,
  );
} catch (e) {
  print('Error playing asset video: $e');
  // Handle the error, e.g., display an error message to the user
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Error playing video: $e'),
    ),
  );
}
    // _videoPlayerController = VideoPlayerController.asset(widget.src!);
    // await Future.wait([_videoPlayerController.initialize()]);
    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   autoPlay: true,
    //   showControls: false,
    //   looping: true,
    // );
    setState(() {});
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: 
                
                Chewie(
                  controller: _chewieController!,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("Loading...")
                  //
                ],
              ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
          // SizedBox(height: 100,),
          // Container(
          //           alignment: Alignment.center,
          //           color: Colors.black,
          //           height: 45,
          //           width: double.infinity,
          //           child: ShakeWidget(
          //             child: Row(
                        
          //               children: [
          //                modeText(title:''),
          //                 modeText(
          //                     title:'🌟${'No Theme'}🌟',),
          //               ],
          //             ),
          //           ),
          //         ),
       OptionsScreen(  titles: widget.slide! ,)
      ],
    );
  }
}