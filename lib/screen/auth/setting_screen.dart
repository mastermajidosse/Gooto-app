import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
//import 'package:feedback/feedback.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gladly/bloc/profile/cubit/profile_cubit.dart';
// import 'package:gladly/config/app_config.dart';
// import 'package:gladly/services/smiles_service.dart';
// import 'package:gladly/services/user_auth_repo.dart';
// import 'package:gladly/utils/connectivity.dart';
// import 'package:gladly/utils/mystyle.dart';
// import 'package:gladly/screens/app_start_screen.dart';
// import 'package:gladly/screens/auth/splash.dart';
// import 'package:gladly/screens/auth/onboarding_screen.dart';
// import 'package:gladly/screens/others/see_all_smiles_screen.dart';
// import 'package:gladly/screens/setting/contactsync_screen.dart';
// import 'package:gladly/screens/setting/deleteit_screen.dart';
// import 'package:gladly/screens/setting/edit_profile_screen.dart';
// import 'package:gladly/screens/others/notif_screen.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:gladly/widgets/img_bigger.dart';
// import 'package:gladly/widgets/user_image.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/onboarding_screen.dart';
import 'package:gooto/services/app_config.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class SettingScreen1 extends StatefulWidget {
  static const routeName = 'setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen1> {
  var image =
      "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg";
  String sh =
      "Hey, i'm using Gooto.\nIt's an app to you travel to the best places in the world.\nI invited you to join. Check it out";

  Future<bool> csac() async {
    return false;
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> stop = [
    'stop',
    'please stop',
    'get some help',
    'stooooop',
    'common man',
    'keep going you are going out',
  ];
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  String toktok = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 55.w),
            child: Container(
             // decoration: MyStyle.appbaDecotatio(),
              width: double.infinity,
              child: Center(
                child: Text(
                  "SETTINGS",
                  style: MyStyle.dashTextStyle.copyWith(
                    fontSize: ScreenUtil().setSp(28),
                    fontFamily: "arial",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileError) {
                return MyStyle.err(ScaffoldMessenger.of(context).showSnackBar, state.message);
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  Container(
                    color: MyStyle.bgcolor,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 16.w),
                        InkWell(
                          // onDoubleTap: () {
                          //   if (state is ProfileLoaded) showsmile(context, state.myuser.imgurl);
                          // },
                          // onTap: () {
                          //   if (state is ProfileLoaded) showsmile(context, state.myuser.imgurl);
                          // },
                          // child: UserImageWidget(
                          //   state is ProfileLoaded
                          //       ? state.myuser.imgurl.toString()
                          //       : AppConfig.defaultUserImage,
                          //   180.w,
                          // ),
                        ),
                        SizedBox(height: 10.w),
                        state is ProfileLoaded
                            ? Column(
                                children: [
                                  SizedBox(height: 10.w),
                                  Text(
                                    "${state.myuser.firstname} ",
                                    //${state.myuser.lastName}
                                    
                                    style: MyStyle.dashTextcoloStyle.copyWith(
                                      fontSize: 28.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.w),
                                  Text(
                                    "test",
                                    //state.myuser.moto.toString(),
                                    style: MyStyle.regularTextStyle,
                                  ),
                                  SizedBox(height: 10.w),
                                  TextButton(
                                    onPressed: () async {
                                      // await Mystyle.chekcnx(context).timeout(
                                      //     Duration(seconds: 3), onTimeout: () {
                                      //   Navigator.pushNamed(context,
                                      //       ConnectivityPage.routeName);
                                      //   return true;
                                      // });
                                      // toktok = await FirebaseAuth
                                      //     .instance.currentUser!
                                      //     .getIdToken(true);
                                      // print("token" + toktok);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (_) => EditProfileScreen(
                                      //       state.myuser,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      height: 35.w,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                          color: MyStyle.primarycolo,
                                          borderRadius: BorderRadius.circular(100)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Edit profile",
                                            style: MyStyle.regularwhiteTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.w),

                  Container(
                    margin: EdgeInsets.only(right: 180.w),
                    decoration: BoxDecoration(
                      color: MyStyle.primarycolo,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: ListTile(
                        onTap: () async {
                          await Share.share(sh);
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Invite Friends",
                            style: MyStyle.regularTextStyle,
                          ),
                        ),
                        trailing: Icon(Icons.share)),
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    margin: EdgeInsets.only(right: 150.w),
                    decoration: BoxDecoration(
                      color: MyStyle.primarycolo,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: ListTile(
                      onTap: () async {
                        // Navigator.pushNamed(
                        //     context, SupportScreen.routeName);
                        // BetterFeedback.of(context).show((UserFeedback feedback) async {
                        //   final screenshotFilePath = await writeImageToStorage(feedback.screenshot);
                        //   final Email email = Email(
                        //     body: feedback.text,
                        //     subject: 'App Feedback',
                        //     recipients: ['contact@gooto.app'],
                        //     attachmentPaths: [screenshotFilePath],
                        //     isHTML: false,
                        //   );

                        //   await FlutterEmailSender.send(email);
                        // });
                      },
                      title: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Help",
                          style: MyStyle.regularTextStyle,
                        ),
                      ),
                      trailing: Icon(Icons.feedback),
                    ),
                  ),
                  SizedBox(height: 10.w),

                  Container(
                    margin: EdgeInsets.only(right: 120.w),
                    decoration: BoxDecoration(
                      color: MyStyle.primarycolo,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: ListTile(
                      onTap: () async {
                        // final Email email = Email(
                        //   body: "",
                        //   subject: 'App Feedback',
                        //   recipients: ['contact@gooto.app'],
                        //   isHTML: false,
                        // );

                        // await FlutterEmailSender.send(email);
                      },
                      title: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Feedback",
                          style: MyStyle.regularTextStyle,
                        ),
                      ),
                      trailing: Icon(Icons.mail_outline),
                    ),
                  ),
                  SizedBox(height: 10.w),

                  Container(
                    margin: EdgeInsets.only(right: 90.w),
                    decoration: BoxDecoration(
                      color: MyStyle.primarycolo,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.zero,
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (_) => OnboardingScreen(false)));
                      },
                      title: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Welcome to Gooto",
                          style: MyStyle.regularTextStyle,
                        ),
                      ),
                      trailing: Icon(Icons.help_outline),
                    ),
                  ),
                  SizedBox(height: 10.w),

                  // Container(
                  //   margin: EdgeInsets.only(right: 60.w),
                  //   decoration: BoxDecoration(
                  //     color: Mystyle.softalarmcolo,
                  //     borderRadius: BorderRadius.only(
                  //       topRight: Radius.circular(100),
                  //       bottomRight: Radius.circular(100),
                  //       topLeft: Radius.zero,
                  //       bottomLeft: Radius.zero,
                  //     ),
                  //   ),
                  //   child: ListTile(
                  //       onTap: () {
                  //         Navigator.pushNamed(
                  //             context, DeleteitScreen.routeName);
                  //       },
                  //       title: Padding(
                  //         padding: EdgeInsets.only(left: 16),
                  //         child: Text(
                  //           "Delete Account",
                  //           style: Mystyle.regularTextStyle,
                  //         ),
                  //       ),
                  //       trailing: Icon(Icons.delete_forever)),
                  // ),
                  // Spacer(),
                  SizedBox(height: ScreenUtil().setHeight(16)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (AppConfig.env == Environment.DEV) {
                            // FirebaseAuth.instance.signOut().then((value) {
                            //   // Navigator.pushReplacementNamed(
                            //   //     context, AppStartScreen.routeName);
                            //   Navigator.pushNamedAndRemoveUntil(
                            //       context, AppStartScreen.routeName, (_) => false);
                            //   // setState(() {
                            //   //   Phoenix.rebirth(context);
                            //   // });
                            // });
                          } else
                            setState(() {
                              clicks++;
                            });
                          switch (clicks) {
                            case 2:
                              MyStyle.err(
                                ScaffoldMessenger.of(context).showSnackBar,
                                "add 3 more",
                                color: Colors.blue,
                              );
                              break;
                            case 5:
                              // Future.delayed(Duration(seconds: 3)).then((value) {
                              //   if (clicks == 5) {
                              //     FirebaseAuth.instance.signOut().then((value) {
                              //       Navigator.pushReplacementNamed(
                              //           context, AppStartScreen.routeName);
                              //     });
                              //   }
                              // });

                              break;

                            case 6:
                              MyStyle.err(
                                ScaffoldMessenger.of(context).showSnackBar,
                                stop[1],
                                color: Colors.blue,
                              );
                              break;
                            case 15:
                              MyStyle.err(
                                ScaffoldMessenger.of(context).showSnackBar,
                                stop[2],
                                color: Colors.blue,
                              );
                              break;
                            case 25:
                              MyStyle.err(
                                ScaffoldMessenger.of(context).showSnackBar,
                                stop[3],
                                color: Colors.blue,
                              );
                              break;
                            case 38:
                              MyStyle.err(
                                ScaffoldMessenger.of(context).showSnackBar,
                                stop[4],
                                color: Colors.blue,
                              );
                              break;
                            case 70:
                              MyStyle.err(
                                ScaffoldMessenger.of(context).showSnackBar,
                                stop[5],
                                color: Colors.blue,
                              );
                              break;
                          }
                        },
                        child: SvgPicture.asset(
                          "assets/Icons/logo.svg",
                          height: 32,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Gooto",
                        style: MyStyle.dashTextcoloStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(16)),
                ],
              );
            },
          )),
    );
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }

  // showsmile(context, smile) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return ImageBigger.imagePop(
  //           MyStyle.isNullEmptyFalseOrZero(smile!) ? AppConfig.defaultSmile : smile!,
  //         );
  //       });
  // }

  int clicks = 0;
}
