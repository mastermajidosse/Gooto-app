import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/widgets/BottomChatField.dart';
import 'package:readmore/readmore.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:timeago/timeago.dart' as timeago;

class PopularDetailsScreen extends StatelessWidget {
  TextEditingController _messageController = TextEditingController();
  final ScrollController messageContoller = ScrollController();
  DateTime createdAt = DateTime.now();
  late final String timeAgo;

  final CardModule place;
  PopularDetailsScreen({super.key, required this.place}) {
    timeAgo = timeago.format(createdAt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250.h,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(image: AssetImage(place.productImg), fit: BoxFit.cover),
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
              place.productName.tr(),
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
                    place.location.toString().tr(),
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
              "Description".tr(),
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            ReadMoreText(
              place.description.tr(),
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.blue,
              trimCollapsedText: 'Show more'.tr(),
              trimExpandedText: 'Show less'.tr(),
              style: TextStyle(color: Colors.grey),
              moreStyle: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 30.h),
            Text(
              "Preview",
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            Container(
              // color: Colors.red,
              height: 100.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: place.previewImgs.length,
                  itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.only(right: 10.w),
                        height: 100.h,
                        // width: 180.w,
                        clipBehavior: Clip.hardEdge,
                        child: InstaImageViewer(
                          child: Image(
                            image: AssetImage(
                              place.previewImgs[i],
                            ),
                            // fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[300], borderRadius: BorderRadius.circular(10.r)),
                      )),
            ),
            SizedBox(height: 40.h),
            Text(
              "Comments",
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            Column(children: [
              Container(
                padding: EdgeInsets.only(bottom: 90),
                //margin: EdgeInsets.only(bottom: 100.h),
                height: 400.h,
                // color: Color(0xFFF5F5F4),
                child: ListView.builder(
                  controller: messageContoller,
                  itemCount: place.listcoments.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    // var commentIndex = commentLength - 1 - index; // Update the comment index

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage("assets/ai.jpg"),
                      ),
                      title: Text(place.listcoments[index].name!
                          // commnt.user.username.toString(),
                          // style: Style.commentusernameTextStyle,
                          ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              // commnt.content.toString(),
                              place.listcoments[index].comment!,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              // style: Style.commentTextStyle,
                            ),
                          ),
                          // Center(
                          //   child: Container(
                          //     child: Text(
                          //      // "ana hna"
                          //        place.listcoments[index].timestamp!.toIso8601String(),
                          //       // style: Style.commentTextStyle,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SingleChildScrollView(
                child: BottomChatField(
                  // postId: postId,
                  onSend: () async {
                    final comment = _messageController.text.trim();
                    if (comment.isNotEmpty) {
                      // context
                      //     .read<s1.CommentBloc>()
                      //     .add(s1.AddCommentEvent(comment, postId));
                      _messageController.clear();
                      await messageContoller.animateTo(
                        0.0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                    // postsService.FetchPosts();
                  },
                  messageController: _messageController,
                ),
              ),
            ]),
          ],
        ),
      ),
    ));
  }
}
