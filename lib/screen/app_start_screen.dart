import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooto/bloc/auth/auth_cubit.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/services/app_config.dart';
import 'package:gooto/utils/MyStyle.dart';

class AppStartScreen extends StatefulWidget {
  static const routeName = 'appstart';

  @override
  _AppStartScreenState createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 7)).then((value) {
      Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {}, child: SplashScreen(radius: 50.5));
  }
}
