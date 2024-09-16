import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/auth/auth_cubit.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/onboarding_screen.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/services/app_config.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStartScreen extends StatefulWidget {
  static const routeName = 'appstart';

  @override
  _AppStartScreenState createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AuthCubit>(context)
    //   ..checkAuth(context).timeout((Duration(seconds: 10)), onTimeout: () {
    //     print("delayed,,,,,,");
    //     Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
    //   });
BlocProvider.of<AuthCubit>(context)..checkAuth(context);
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated || state is Uninitialized) {

            _checkFirstSeen();
          } else if (state is Authenticated) {
            Future.delayed(Duration(seconds: 5))
              .then((value) => Navigator.pushReplacementNamed(context, BottomTabBarr.routeName));
          }
        },
        child: SplashScreen(radius: 50.5));
    //   Scaffold(
    //     backgroundColor: MyStyle.primarycolo,
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   ),
    // );
  }
  bool visited = false;
  Future<void> _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('walkseen') ?? false);
    if (_seen) {
      Future.delayed(Duration(seconds: 5))
          .then((value) => Navigator.pushReplacementNamed(context, BottomTabBarr.routeName));
    } else {
      await prefs.setBool('walkseen', true);
      print("first");

      Future.delayed(Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, OnboardingScreen.routeName));
    }
    setState(() {
      visited = _seen;
    });
  }
}
