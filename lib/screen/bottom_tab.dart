import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    VideosScreen(),
    // SaveScreen(),
    ImageScreen(),
    ExplloreScreen(),
    // SettingScreen(),
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
            // notchMargin: 4.0,
            color: Colors.white,
            elevation: 0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                costumcollum(Icons.home, Icons.home_outlined, 0),
                costumcollum(FontAwesomeIcons.youtube, Icons.video_collection_outlined, 1),
                costumcollum(Icons.favorite, Icons.favorite_outline, 2),
                costumcollum(Icons.explore, Icons.explore_outlined, 3),
                // costumcollum(Icons.person, Icons.person_outline, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

//
  costumcollum(ico, txt, numb) {
    return InkWell(
      onTap: () => _onItemTapped(numb),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        // width: ScreenUtil().screenWidth / 3,
        child: Icon(
          _selectedIndex == numb ? ico : txt,
          size: _selectedIndex == numb ? 32 : 28,
          color: _selectedIndex == numb ? MyStyle.primarycolo : Colors.black54,
          // color: MyStyle.primarycolo,
        ),
      ),
    );
  }
}
