import 'package:flutter/material.dart';
import 'package:gooto/main_production.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/auth/onboarding_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/screen/profile/setting_screen.dart';

String initialRoute = SplashScreen.routeName;

class RoutGenerator {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case BottomTabBarr.routeName:
        return MaterialPageRoute(builder: (_) => BottomAppBar());
        // case LoginPage.routeName:
        //     return MaterialPageRoute(builder: (_)=> LoginPage());
      case OnboardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
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
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
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
