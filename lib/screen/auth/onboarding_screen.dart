import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/onBordingModel.dart';
import 'package:gooto/screen/auth/splash_screen.dart';
import 'package:gooto/utils/mystyle.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'OnboardingScreen';

  // bool isonboarding = false;
  OnboardingScreen(); // this.isonboarding
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  //logowalk.svg
  List onBoardingData = [
    OnBoardingData(
      firsttitle: "Welcome to Gooto",
      title: "Discover the Magic of travel 🌐",
      desc:
          "Experience the rich culture and stunning landscapes of Morocco with Gooto. Our app provides personalized travel recommendations to help you explore the best attractions, restaurants, and accommodations.",
      imageAssetsPath: "assets/onboarding/goal1.png",
    ),
    OnBoardingData(
      firsttitle: "Recommendations",
      title: "Tailored Just for You ⚔️",
      desc:
          "Gooto uses advanced AI with to understand your preferences and interests. Receive customized suggestions for destinations and activities that match your unique travel style.",
      imageAssetsPath: "assets/onboarding/goal2.png",
    ),
    OnBoardingData(
      firsttitle: "Immersive Experiences",
      title: "Dive into Morocco's Heritage 🇲🇦",
      desc:
          "At first Gooto is just about Morocco's lean about history and culture through detailed insights and stories. we brings each location to life, offering a deeper connection to the places you visit.",
      imageAssetsPath: "assets/onboarding/goal3.png",
    ),
    OnBoardingData(
      firsttitle: "Audio Stories",
      title: "Ultimate Travel Companion 🎧",
      desc:
          "Discover Morocco through engaging audio-generated stories that bring each location to life. Get ready for a seamless and enjoyable journey!",
      imageAssetsPath: "assets/onboarding/goal4.png",
    ),
  ];

  PageController controller = PageController();
  Future<bool> csac() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // final _deviceHeight = ScreenUtil().screenHeight;
    final _deviceWidth = ScreenUtil().screenWidth;
    return WillPopScope(
      onWillPop: csac,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView.builder(
              controller: controller,
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20.h),
                        Container(
                          // height: 38.h,
                          // width: 150,

                          padding: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            // border: Border.all (color: Colors.red, width: 2),
                            border: Border(
                                bottom: BorderSide(
                              color: MyStyle.primarycolo,
                              width: 10,
                            )),
                          ),
                          child: Text(
                            onBoardingData[index].firsttitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MyStyle.primarycolo,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 300.h,
                          width: _deviceWidth,
                          alignment: Alignment.center,
                          child: Image.asset(
                            '${onBoardingData[index].imageAssetsPath}',
                            width: 300,
                            height: 300,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${onBoardingData[index].title}',
                            style: TextStyle(
                              color: MyStyle.primarycolo,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 35.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${onBoardingData[index].desc}',
                            // style: Mystyle.blackboldtexts,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onBoardingData.length, (index) {
                      return Container(
                        height: 12,
                        width: 12,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: index == currentIndex ? Colors.blue : Colors.black12,
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex == onBoardingData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashScreen(),
                          ),
                        );

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AppStartScreen(),
                        //   ),
                        // );
                      } else {
                        controller.nextPage(
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    onLongPress: () {
                      // Phoenix.rebirth(context);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => SplashScreen()));
                    },
                    child: Container(
                      height: 80.h,
                      width: 100.w,
                      padding: EdgeInsets.only(right: 35.w),
                      alignment: Alignment.centerRight,
                      color: Colors.transparent,
                      child: Text(
                        currentIndex == onBoardingData.length - 1 ? "Start" : 'Next',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenUtil().setSp(13),
                        ).copyWith(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
