import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/auth/signup_cubit.dart';
import 'package:gooto/models/user_model.dart';
import 'package:gooto/screen/app_start_screen.dart';
import 'package:gooto/screen/auth/login_screen.dart';
import 'package:gooto/screen/bottom_tab.dart';
import 'package:gooto/utils/mystyle.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();

  final username = TextEditingController();
  final surname = TextEditingController();

  final pass = TextEditingController();

  final country = TextEditingController();

  List countries = ['Morocco'];

  String count = "Morocco";

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  String patttern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    //Grab a refernce to the bloc using bloc provider

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupError) {
              return MyStyle.err(ScaffoldMessenger.of(context).showSnackBar, state.message);
            } else if (state is SignupSuccess) {
              print("brace you gonna login");
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomTabBarr()));
              Navigator.pushReplacementNamed(context, AppStartScreen.routeName);
            }
          },
          builder: (context, state) {
            return Center(
              child: Container(
                width: 300.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 120.w,
                        width: 120.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Register new account',
                        style: TextStyle(
                          color: Color(0xFFB1B1B1),
                          fontFamily: "Ubuntu-Regular",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50.w),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(color: Colors.black54),
                                controller: username,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'enter your name';
                                  }
                                  return null;
                                },
                                decoration: MyStyle.inputregular("Full name").copyWith(
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: MyStyle.primarycolo,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: TextFormField(
                                cursorColor: Colors.blueGrey,
                                controller: email,
                                decoration: MyStyle.inputregular('Email'),
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
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !_passwordVisible,
                                style: TextStyle(color: Colors.black54),
                                controller: pass,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'enter you password';
                                  }
                                  return null;
                                },
                                decoration: MyStyle.inputregular("Password").copyWith(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                      color: _passwordVisible ? Colors.black : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 66.w),
                        child: Container(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: MyStyle.primarycolo,
                              padding: EdgeInsets.only(top: 16.w, bottom: 16.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              "Register",
                              style: MyStyle.subtitleTextStyle
                                  .copyWith(fontSize: 18.sp, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              // FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                UserModel newUserModel = UserModel(
                                  email: email.text,
                                  password: pass.text,
                                  firstname: username.text,
                                );
                                context.read<SignupCubit>().registerNewuser(newUserModel, context);
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomTabBarr()));
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Color(0xFFB1B1B1)),
                            padding: EdgeInsets.only(top: 16.w, bottom: 16.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back, color: MyStyle.primarycolo),
                              SizedBox(width: 10.w),
                              Text(
                                "Back to login",
                                style: MyStyle.subtitleTextStyle
                                    .copyWith(fontSize: 18.sp, color: MyStyle.primarycolo),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, LoginPage.routeName);
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
