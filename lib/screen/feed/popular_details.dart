import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gooto/utils/mystyle.dart';

class PopularDetails extends StatefulWidget {
  BlogModel blogModel;
  PopularDetails(this.blogModel);

  @override
  State<PopularDetails> createState() => _PopularDetailsState(blogModel);
}

class _PopularDetailsState extends State<PopularDetails> {
  _PopularDetailsState(this.blogModel);
  BlogModel blogModel;

  @override
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<StoreCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 300.w,
            color: Colors.black,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(blogModel.imgurl.toString()),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 39.w,
                      width: 39.w,
                      child: BackButton(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 150,
                    alignment: Alignment.bottomLeft,
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        blogModel.title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              blogModel.location.toString(),
              style: MyStyle.blackCatTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            // child: blog.id == 10
            child: HtmlWidget(
              blogModel.desc.toString(),
              renderMode: RenderMode.column,

              // set the default styling for text
              textStyle: TextStyle(fontSize: 18.sp, height: 1.3),

              // style: {
              //   "br": Style(
              //     height: 0,
              //     margin: EdgeInsets.zero,
              //     padding: EdgeInsets.zero,
              //   ),
              //   "p": Style(
              //     // height: 0,
              //     margin: EdgeInsets.zero,
              //     padding: EdgeInsets.zero,
              //   ),
              // },
            ),
            //     : Text(blog.desc.toString()),
            // child: Text(
            //   blogModel.desc.toString(),
            //   style: Mystyle.blackCatTextStyle,
            // ),
          ),
        ],
      ),
    );
  }
}
