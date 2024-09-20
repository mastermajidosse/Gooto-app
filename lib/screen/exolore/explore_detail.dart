import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class DetailsExplore extends StatefulWidget {
  BlogModel blogModel;
  DetailsExplore(this.blogModel);

  @override
  State<DetailsExplore> createState() => _DetailsExploreState(blogModel);
}

class _DetailsExploreState extends State<DetailsExplore> {
  _DetailsExploreState(this.blogModel);
  BlogModel blogModel;

  @override
  void initState() {
    super.initState();
  }

  String addStyles(String txt) {
    return txt.replaceAll("<p>", "<p style=\"color: #444; text-align: justify;\">");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.h),
            child: Container(
              height: 330.h,
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30.r)),
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
                      // image: NetworkImage(blogModel.imgurl.toString()),
                      image: imageProvider,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(blogModel.rate.toString())
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      blogModel.title.toString().tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(30),
                        // color: Colors.white,
                        height: 1,
                      ),
                    )),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    blogModel.price != null
                        ? Text(
                            blogModel.price.toString().tr(),
                            style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                          )
                        : Container()
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "Overview".tr(),
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                HtmlWidget(
                  addStyles(blogModel.desc.toString()).tr(),
                  renderMode: RenderMode.column,

                  // set the default styling for text
                  textStyle: TextStyle(fontSize: 17.sp, height: 1.3),
                ),
                SizedBox(height: 30.h),
                Container(
                  // color: Colors.red,
                  height: 100.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 0,
                      itemBuilder: (context, i) => Container(
                            margin: EdgeInsets.only(right: 10.w),
                            height: 100.h,
                            // width: 180.w,
                            clipBehavior: Clip.hardEdge,
                            child: InstaImageViewer(
                              child: Image(
                                image: AssetImage(
                                  blogModel.previewImgs![i],
                                ),
                                // fit: BoxFit.cover,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey[300], borderRadius: BorderRadius.circular(10.r)),
                          )),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
