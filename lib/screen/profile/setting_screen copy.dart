import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/profile/profile_cubit.dart';
import 'package:gooto/screen/profile/edit_profile_screen.dart';
import 'package:gooto/screen/profile/signup_profile_screen.dart';
import 'package:gooto/services/service/auth_service.dart';
import 'package:gooto/utils/imageWidget.dart';
import 'package:gooto/utils/img_bigger.dart';
import 'package:gooto/utils/MyStyle.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var image = "https://i0.wp.com/rouelibrenmaine.fr/wp-content/uploads/2018/10/empty-avatar.png";
  String sh = "مرحبا بكم في تطبيق التراس حيت نشارك جميع معلومات وقصص واخبار اللتراس المغرب ";
  Future<bool> csac() async {
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ProfileCubit>(context).profile();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state is ProfileLoaded
              ? Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      state.myuser.firstname.toString(),
                      style: MyStyle.playernameTextStyle,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: ListView(
                      children: [
                        // profile photo
                        SizedBox(height: 15.h),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.favorite_outline, color: Colors.transparent, size: 46),
                              //Image.memory(widget.imageBytes!),
                              UserImageWidget(
                                state.myuser.imgurl.toString(),
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
                            '@${state.myuser.firstname} ',
                            style: MyStyle.buttTextStyle,
                          ),
                        ),

                        SizedBox(height: 50.h),

                        SizedBox(height: 18.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 22),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(context, );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => EditProfileScreen(state.myuser)));
                                },
                                child: Container(
                                  decoration: MyStyle.cardhome(),
                                  // width: ,
                                  height: 47,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Edit Profile",
                                    style: MyStyle.dash13TextStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 22),
                          ],
                        ),
                        SizedBox(height: 18.h),
                      ],
                    ),
                  ),
                )
              : state is ProfileError
                  ? SignupProfileScreen('profile')
                  : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
