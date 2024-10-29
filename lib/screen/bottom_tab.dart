import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/auth/auth_cubit.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/screen/ai/camera_screen.dart';
import 'package:gooto/screen/ai/chatai.dart';
import 'package:gooto/screen/allPopular_screen.dart';
import 'package:gooto/screen/audio/AudioGeneral.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/auth/setting_screen.dart';
import 'package:gooto/screen/exolore/articles.dart';
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

// class _BottomTabBarrState extends State<BottomTabBarr> {
//   int _selectedIndex = 0;
// final _scaffoldKey = GlobalKey<ScaffoldState>();
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   static List _widgetOptions = [
//     HomeScreen(),
//     PodcastDiscoveryScreen(),
//     CameraScreen(),
//     PostWidget(),
//     ChatAIScreen(),
//     SettingScreen(),
//   ];
//   static List _widgetOptionsunauth = [
//     HomeScreen(),
//     PodcastDiscoveryScreen(),
//     CameraScreen(),
//     PostWidget(),
//     ChatAIScreen(),
//     LoginPage(),
//   ];
//   var provider;

//   @override
//   Widget build(BuildContext context) {
//    //Scaffold.geometryOf(context);
//     return
//     BlocBuilder<AuthCubit, AuthState>(
//       builder: (context, state) {
//      return
//        Scaffold(
//                 key: _scaffoldKey,
//           body: state is Authenticated
//               ? BlocBuilder<ProfileCubit, ProfileState>(
//                   builder: (context, profileState) {
//                       if (profileState is ProfileLoaded) {
//                     // Use _widgetOptions which includes SettingScreen for authenticated users
//                     return _widgetOptions.elementAt(_selectedIndex);
//                   } else {
//                     // Show a loading indicator or fallback widget while profile is loading
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   },
//                 )
//               : widget.widgetoutside ?? _widgetOptionsunauth.elementAt(_selectedIndex),
//         bottomNavigationBar: Container(
//           height: 50.w,
//           width: double.infinity,
//           child: BottomAppBar(
//             // notchMargin: 4.0,
//             color: widget.widgetoutside == 1 ? Colors.black : Colors.white,
//             elevation: 0,
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 costumcollum("assets/icons/home.png", "assets/icons/home.png", 0),
//                 costumcollum("assets/icons/audio.png", "assets/icons/audio.png", 1),
//                 costumcollum("assets/icons/cameraai.png", "assets/icons/cameraai.png", 2),
//                 costumcollum("assets/icons/news.png", "assets/icons/news.png", 3),
//                 costumcollum("assets/icons/geminig.png", "assets/icons/geminig.png", 4),
//                  costumcollum("assets/icons/geminig.png", "assets/icons/geminig.png", 5),
//                 // costumcollum("assets/icons/audio.png", "assets/icons/audio.png", 5),
//                 // costumcollum(Icons.person, Icons.person_outline, 4),
//               ],
//             ),
//           ),
//         ),
//       );
//       }
//     );
//   }

// //
//   costumcollum(String img, txt, numb) {
//     return InkWell(
//       onTap: () => _onItemTapped(numb),
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       child: Container(
//         // width: ScreenUtil().screenWidth / 3,
//         child: Image.asset(
//           // _selectedIndex == numb ? img : txt,
//           img,
//           width: _selectedIndex == numb ? 28 : 23,
//           color: _selectedIndex == numb ? MyStyle.primarycolo : Colors.black54,
//         ),
//       ),
//     );
//   }
// }
class _BottomTabBarrState extends State<BottomTabBarr> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).checkAuth(context);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _getWidgetOptions( isAuthenticated) {
    return [
      HomeScreen(),
      PodcastDiscoveryScreen(),
      CameraScreen(),
      //PopularPlacesScreen(),
      ExplloreScreen(),
      //PostWidget(),
      ChatAIScreen(),
      //isAuthenticated ? SettingScreen() : LoginPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isAuthenticated = state is Authenticated;
       
    //                context.read<AuthCubit>().checkAuth(context);

    // // Access the current state of the AuthCubit after checkAuth()
    // final authState = context.read<AuthCubit>().state;

    // if (authState is Authenticated) {
    //   // If authenticated, create the order
    //         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    // } else if (authState is Unauthenticated) {
    //   // If unauthenticated, navigate to the login page or product detail
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>SettingScreen (),
    //     ),
    //   );
    // }
 final widgetOptions = _getWidgetOptions(isAuthenticated);
        return SafeArea(child: 
         Scaffold(
          key: _scaffoldKey,
          body: widget.widgetoutside ?? widgetOptions.elementAt(_selectedIndex),
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
                  //costumcollum("assets/icons/geminig.png", "assets/icons/geminig.png", 4),
                ],
              ),
            ),
          ),
         )
        );
      },
    );
  }

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
  // ... existing costumcollum method ...
}
