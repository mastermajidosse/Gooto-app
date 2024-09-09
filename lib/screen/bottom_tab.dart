import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/screen/ai/camera_screen.dart';
import 'package:gooto/screen/ai/chatai.dart';
import 'package:gooto/screen/audio/AudioGeneral.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
final _scaffoldKey = GlobalKey<ScaffoldState>();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List _widgetOptions = [
    HomeScreen(),
    PodcastDiscoveryScreen(),
    CameraScreen(),
    PostWidget(),
    // ExplloreScreen(),
    ChatAIScreen(),
    //LoginPage(),
    //RegisterScreen(),
  ];
  var provider;

  @override
  Widget build(BuildContext context) {
   //Scaffold.geometryOf(context);
    return 
    SafeArea(
      child:
       Scaffold(
        key: _scaffoldKey,
        body: widget.widgetoutside ?? _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: 50.w,
          width: double.infinity,
          child: BottomAppBar(
            // notchMargin: 4.0,
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
                //// costumcollum("assets/icons/geminig.png", "assets/icons/geminig.png", 5),
                // costumcollum("assets/icons/audio.png", "assets/icons/audio.png", 5),
                // costumcollum(Icons.person, Icons.person_outline, 4),
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
        // width: ScreenUtil().screenWidth / 3,
        child: Image.asset(
          // _selectedIndex == numb ? img : txt,
          img,
          width: _selectedIndex == numb ? 28 : 23,
          color: _selectedIndex == numb ? MyStyle.primarycolo : Colors.black54,
        ),
      ),
    );
  }
}
