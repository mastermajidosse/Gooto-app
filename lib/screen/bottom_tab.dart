import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/screen/ai/camera_screen.dart';
import 'package:gooto/screen/ai/chatai.dart';
import 'package:gooto/screen/audio/AudioGeneral.dart';
import 'package:gooto/screen/feed/home_screen.dart';
import 'package:gooto/screen/feed/save_screen.dart';
import 'package:gooto/screen/others/image_screen.dart';
import 'package:gooto/screen/others/store_screen.dart';
import 'package:gooto/screen/profile/setting_screen.dart';
import 'package:gooto/screen/exolore/explore_screen.dart';
import 'package:gooto/screen/videos/videos_screen.dart';
import 'package:gooto/utils/MyStyle.dart';

class BottomTabBarr extends StatefulWidget {
  static const routeName = 'bottomtab';

  Widget? widgetoutside;

  BottomTabBarr({this.widgetoutside});

  @override
  _BottomTabBarrState createState() => _BottomTabBarrState();
}

class _BottomTabBarrState extends State<BottomTabBarr> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List _widgetOptions = [
    HomeScreen(),
    PodcastDiscoveryScreen(),
    CameraScreen(),
    ExplloreScreen(),
    ChatAIScreen(),
  ];
  var provider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.widgetoutside ?? _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: 50.w,
          width: double.infinity,
          child: BottomAppBar(
            color: widget.widgetoutside == 1 ? Colors.black : Colors.white,
            elevation: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                costumcollum("assets/icons/home.png", "assets/icons/home.png", 0),
                costumcollum("assets/icons/audio.png", "assets/icons/audio.png", 1),
                costumcollum("assets/icons/cameraai.png", "assets/icons/cameraai.png", 2),
                costumcollum("assets/icons/news.png", "assets/icons/news.png", 3),
                costumcollum("assets/icons/geminig.png", "assets/icons/geminig.png", 4),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

//
  costumcollum(String img, txt, numb) {
    return InkWell(
      onTap: () => _onItemTapped(numb),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        child: Image.asset(
          img,
          width: _selectedIndex == numb ? 28 : 23,
          color: _selectedIndex == numb ? MyStyle.primarycolo : Colors.black54,
        ),
      ),
    );
  }
}
