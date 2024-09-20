import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/auth/signup_cubit.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/screen/about/rules_screen.dart';
import 'package:gooto/screen/profile/signup_profile_screen.dart';
import 'package:gooto/services/app_config.dart';
import 'package:gooto/services/service/auth_service.dart';
import 'package:gooto/services/service/auth_service.dart';
import 'package:gooto/services/service/auth_service.dart';
import 'package:gooto/utils/imageWidget.dart';
import 'package:gooto/utils/img_bigger.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../services/service/auth_service.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var image = "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png";
  String sh =
      "Hey, i'm using Gooto.\nIt's an app to you travel to the best places in the world.\nI invited you to join. Check it out";
  Future<bool> csac() async {
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProfileCubit>(context).profile();
    super.initState();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return state is ProfileLoaded
          ? Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Profile',
                  style: MyStyle.blackalarmTextStyle,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: Column(
                children: [
                  // profile photo
                  SizedBox(height: 55.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.favorite_outline, color: Colors.transparent, size: 46),
                        //Image.memory(widget.imageBytes!),
                        UserImageWidget(
                          state.myuser.imgurl!,
                          //'assets/AI.png',
                          ScreenUtil().setHeight(110),
                        ),
                        Icon(Icons.favorite_outline, color: Colors.transparent, size: 46),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),

                  // username
                  Center(
                    child: Text(
                      state.myuser.firstname!,
                      style: MyStyle.dashTextStyle,
                    ),
                  ),

                  SizedBox(height: 18.h),

                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.pushNamed(context, );
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (_) => EditProfileScreen(UserModel())));
                  //   },
                  //   child: Container(
                  //     decoration: MyStyle.cardhome(),
                  //     // width: ,
                  //     height: 47,
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       "Edit Profile",
                  //       style: MyStyle.dash13TextStyle,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 55.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[200]!,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListTile(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => EditProfileScreen(state.myuser)));
                          },
                          title: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "Edit profile",
                              style: MyStyle.regularTextStyle,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right_sharp)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[200]!,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListTile(
                          onTap: () {
                            Share.share(sh);
                          },
                          title: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "Invite Friends",
                              style: MyStyle.regularTextStyle,
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right_sharp)),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[200]!,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListTile(
                        onTap: () async {
                          launchUrlString("https://gooto.app");
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (_) => RulesScreen()));
                          // final Email email = Email(
                          //   body: "",
                          //   subject: '',
                          //   recipients: ['mastermajidosse@gmail.com'],
                          //   isHTML: false,
                          // );

                          // await FlutterEmailSender.send(email);
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Contact us",
                            style: MyStyle.regularTextStyle,
                          ),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[200]!,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListTile(
                        onTap: () {
                          // UserRepository user=UserRepository();
                          context.read<SignupCubit>().socialSignOut(context);
                          Navigator.of(context).pop(context);
                          //  ProfileCubit().
                          //   user?.signOut().then((value) {
                          //     Phoenix.rebirth(context);
                          //   });
                        },
                        title: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Logout",
                            style: MyStyle.regularTextStyle,
                          ),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right_sharp),
                      ),
                    ),
                  ),
                  // SizedBox(height: 25),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 60.w,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage("assets/icon.png"),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Text(
                          "Gooto",
                          style: MyStyle.buttTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(25)),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
