import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/blog/blog_cubit.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';
import 'package:gooto/services/api/getdata.dart';
import 'package:gooto/utils/mystyle.dart';

class ExplloreScreen extends StatefulWidget {
  static const routeName = 'Stories';

  @override
  _ExplloreScreenState createState() => _ExplloreScreenState();
}

class _ExplloreScreenState extends State<ExplloreScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BlogCubit>(context).initBlog();
  }

  String removeHtmlTags(String htmlText) {
    // Regular expression to match HTML tags
    RegExp tagExp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    // Replace all HTML tags with an empty string
    String cleanedText = htmlText.replaceAll(tagExp, '');

    // Replace multiple whitespaces with a single space and trim the string
    cleanedText = cleanedText.replaceAll(RegExp(r'\s+'), ' ').trim();

    return cleanedText.trim().tr();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 16, 56, 66),
          ),
          height: 60.h,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "Explore",
            style: MyStyle.dashTextStyle.copyWith(
              fontSize: ScreenUtil().setSp(18),
              fontFamily: "arial",
              color: Colors.grey[50],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: BlocBuilder<BlogCubit, BlogState>(
        builder: (context, state) {
          return state.loading == false
              ? ListView.builder(
                  itemCount: state.stories!.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  shrinkWrap: true,
                  itemBuilder: (context, indexx) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      child: InkWell(
                        onTap: () {
                          print("goto");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsExplore(state.stories![indexx]),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 200.h,
                              width: ScreenUtil().screenWidth - 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(state.stories![indexx].imgurl.toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.black.withOpacity(.3),
                                        Colors.black.withOpacity(.1),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenUtil().screenWidth - 50,
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Text(
                                state.stories![indexx].title.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenUtil().screenWidth - 50,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                removeHtmlTags(state.stories![indexx].desc.toString())
                                    .substring(0, 98),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                  height: 1.5,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Container(
                              color: Colors.grey[100],
                              height: 25.h,
                            )
                          ],
                        ),
                      ),
                    );
                    // );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    ));
  }
}
