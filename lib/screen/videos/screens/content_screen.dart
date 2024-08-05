import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gooto/screen/videos/screens/like_icon.dart';
import 'package:gooto/screen/videos/screens/options_screen.dart';

import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String src;
  final String? slide;
  const ContentScreen({Key? key, required this.src, this.slide})
      : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  bool _liked = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    try {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.src))
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        })
        ..setLooping(true)
        ..play();
    } catch (e) {
      print('Error playing asset video: $e');
      // Handle the error, e.g., display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error playing video: $e'),
        ),
      );
    }
  }

  bool videoPaused = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: _controller.value.isInitialized
              ? InkWell(
                  onDoubleTap: () {
                    setState(() {
                      _liked = !_liked;
                    });
                  },
                  onTap: () {
                    if (videoPaused) {
                      _controller.play();
                      videoPaused = false;
                    } else {
                      _controller.pause();
                      videoPaused = true;
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : CircularProgressIndicator(color: Colors.white),
        ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen(
          titles: widget.slide!,
        )
      ],
    );
  }
}
