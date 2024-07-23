import 'package:flutter/material.dart';
import 'package:gooto/models/video_model.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/screen/profile/setting_screen.dart';
import 'package:gooto/services/service/firestore_service.dart';
import 'package:gooto/widgets/all_activities_screen.dart';
import 'package:gooto/screen/allPopular_screen.dart';

class VideoDataScreen extends StatefulWidget {
  @override
  _VideoDataScreenState createState() => _VideoDataScreenState();
}

class _VideoDataScreenState extends State<VideoDataScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_firestoreService.getVideos());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              List<VideoModel> videos = [
                VideoModel(id: 1, name: "vid1", url: "https://www.google.com")
              ];

              await _firestoreService.addVideos(videos);
              print("----------> Videos added to Firestore!");
            },
            child: Text('Add Videos'),
          ),
          ElevatedButton(
            onPressed: () async {
              // List<VideoModel> videos = [
              //   VideoModel(id: 1, name: "vid1", url: "https://www.google.com")
              // ];

              // await _firestoreService.addVideos(videos);
              // print("----------> Videos added to Firestore!");
            },
            child: Text('Get Videos'),
          ),
          Text("total:11")
          // StreamBuilder<List<VideoModel>>(
          //   stream: _firestoreService.getVideos(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Center(child: Text('Error: ${snapshot.error}'));
          //     }
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     }

          //     final videos = snapshot.data ?? [];

          //     return ListView.builder(
          //       itemCount: videos.length,
          //       itemBuilder: (context, index) {
          //         final video = videos[index];
          //         return ListTile(
          //           title: Text(video.name ?? ""),
          //           subtitle: Text(video.url ?? ""),
          //           onTap: () {
          //             // Handle video tap, e.g., navigate to a video player screen
          //           },
          //         );
          //       },
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

String initialRoute = SplashScreen.routeName;
// String initialRoute = AppStartScreen.routeName;

class RoutGenerator {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case BottomTabBarr.routeName:
        return MaterialPageRoute(builder: (_) => VideoDataScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppStartScreen.routeName:
        return MaterialPageRoute(builder: (_) => AppStartScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case SettingScreen.routeName:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      // case MoreScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => MoreScreen());
      // case EditProfileScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => EditProfileScreen(UserModel()));
      // case AppStartScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => AppStartScreen());
      // case "homeslide":
      //   return SlideRightRoute(BottomTabBarr(
      //     widgetoutside: DashBoardScreen(),
      //   ));
      // case "Alarm_screen":
      //   return SlideRightRoute(BottomTabBarr(
      //     widgetoutside: AlarmScreen(),
      //   ));
////
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ErrorRoute'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute(this.widget)
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
