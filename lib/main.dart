import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/bproviders.dart';
import 'package:gooto/config/save.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/route_genetator.dart' as router;
// import 'package:gooto/screen/auth/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp(this.flavor, {super.key});
  final String flavor;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    shared();
  }

  shared() async {
    Save.prefs = await SharedPreferences.getInstance();
    Save().setonlyonce(false);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: bproviders,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Gooto',
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: MyStyle.primarycolo,
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: router.RoutGenerator.generateRout,
            initialRoute: router.initialRoute,
            // home: OnboardingScreen(),
          );
        },
      ),
    );
  }
}
