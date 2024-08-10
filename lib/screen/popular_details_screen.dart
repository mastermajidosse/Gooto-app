import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/card.dart';
import 'package:readmore/readmore.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class PopularDetailsScreen extends StatelessWidget {
  final CardModule place;
  PopularDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Text("detail"),
            ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image:
                          DecorationImage(image: AssetImage(place.productImg), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.r)),
                ),
                SizedBox(height: 10.h),
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
                          Text(place.rating.toString())
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  place.productName,
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.lightBlue,
                    ),
                       Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              place.location.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                height: 1.5,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
                    // Text(
                      
                    //   style: TextStyle(color: Colors.grey),
                    // )
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(height: 10.h),
                ReadMoreText(
                  place.description,
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: Colors.blue,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: TextStyle(color: Colors.grey),
                  moreStyle: TextStyle(
                      // fontSize: 12.sp,
                      // fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 30.h),
                // Text(
                //   "Preview",
                //   style: TextStyle(fontSize: 18.sp),
                // ),
                // SizedBox(height: 10.h),
                // Container(
                //   // color: Colors.red,
                //   height: 100.h,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: place.previewImgs.length,
                //       itemBuilder: (context, i) => Container(
                //             margin: EdgeInsets.only(right: 10.w),
                //             height: 100.h,
                //             // width: 180.w,
                //             clipBehavior: Clip.hardEdge,
                //             child: InstaImageViewer(
                //               child: Image(
                //                 image: AssetImage(
                //                   place.previewImgs[i],
                //                 ),
                //                 // fit: BoxFit.cover,
                //               ),
                //             ),
                //             decoration: BoxDecoration(
                //                 color: Colors.grey[300], borderRadius: BorderRadius.circular(10.r)),
                //           )),
                // ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ));
  }
}
