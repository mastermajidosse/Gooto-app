import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class StoriesScreen extends StatefulWidget {
  BlogModel blogModel;
  StoriesScreen(this.blogModel);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState(blogModel);
}

class _StoriesScreenState extends State<StoriesScreen> {
  _StoriesScreenState(this.blogModel);
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
            color: Colors.black,
            child: CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(Icons.image_not_supported_sharp, size: 50.sp),
              ),
              imageUrl: blogModel.imgurl.toString(),
              imageBuilder: (context, imageProvider) => Container(
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
                    image: NetworkImage(blogModel.imgurl.toString()),
                    //  imageProvider,
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
                    Container(
                      alignment: Alignment.bottomRight,
                      height: 200.w,
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
                        padding: const EdgeInsets.all(8.0),
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
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              // child: blog.id == 10
              child: HtmlWidget(
                blogModel.desc.toString(),
                renderMode: RenderMode.column,

                // set the default styling for text
                textStyle: TextStyle(fontSize: 14),

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
          ),
        ],
      ),
    );
  }
}
