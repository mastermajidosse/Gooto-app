import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/auth/login_cubit.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/register_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/utils/mystyle.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  //
  final _passwordController = TextEditingController();

// mastermajidosse@gmail.com
  String patttern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            return MyStyle.err(ScaffoldMessenger.of(context).showSnackBar, state.message);
          } else if (state is LoginSuccess) {
            print("brace you gonna login");
            Navigator.pushReplacementNamed(context, AppStartScreen.routeName);
          }
        },
        builder: (context, state) {
          return Center(
            child: Container(
              width: 360.w,
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 127.w,
                      height: 127.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE2E9F1),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset("assets/icon.png"),
                    ),
                    SizedBox(height: 66.h),
                    Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email or Username",
                              style: TextStyle(
                                color: Color(0xFFB1B1B1),
                                fontFamily: "Ubuntu-Regular",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              controller: _usernameController,
                              decoration: MyStyle.inputregular('Email',
                                  // radius: 8.0,
                                  oneicon: Icon(
                                    Icons.person_rounded,
                                    color: Colors.black,
                                  )),
                              style: TextStyle(color: Colors.black54),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter you email';
                                } else {
                                  value = value.trim();
                                  print(value);
                                  if (!RegExp(patttern).hasMatch(value)) {
                                    return 'enter a correct email';
                                  } else
                                    return null;
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Color(0xFFB1B1B1),
                                fontFamily: "Ubuntu-Regular",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              style: TextStyle(color: Colors.black54),
                              controller: _passwordController,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'enter you password';
                                }
                                return null;
                              },
                              decoration: MyStyle.inputregular("Password",
                                  // radius: 8.0,
                                  oneicon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.black,
                                  )),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 66.w),
                      child: Container(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: MyStyle.primarycolo,
                            padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: MyStyle.subtitleTextStyle
                                .copyWith(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   FocusScope.of(context).requestFocus(FocusNode());
                            //   context.read<LoginCubit>().login(context,
                            //       _usernameController.text.trim(), _passwordController.text.trim());
                            // }
                            // FocusScope.of(context).requestFocus(FocusNode());
                            // if (_formKey.currentState!.validate()) {
                            //   context.read<LoginCubit>().login(context,
                            //       _usernameController.text.trim(), _passwordController.text.trim());
                            // }
                            //
                            Future.delayed(Duration(seconds: 5)).then((_) {
                              Navigator.pushReplacementNamed(context, AppStartScreen.routeName);
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Wrap(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color(0xFFD1D1D1),
                            fontFamily: "Ubuntu-Regular",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                          borderRadius: BorderRadius.circular(4.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              'Sign up',
                              style: MyStyle.todayTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90.h),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, BottomTabBarr.routeName);
                        },
                        child: Container(
                          child: Text(
                            "Bypass login",
                            style: TextStyle(
                              color: MyStyle.primarycolo,
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil().setSp(14),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _buildSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
      ..showSnackBar(snackBar);
  }
}
