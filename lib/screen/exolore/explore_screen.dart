import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/blog/blog_cubit.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';
import 'package:gooto/services/api/getdata.dart';
import 'package:gooto/utils/mystyle.dart';

// class ExplloreScreen extends StatefulWidget {
//   static const routeName = 'Stories';

//   @override
//   _ExplloreScreenState createState() => _ExplloreScreenState();
// }

// class _ExplloreScreenState extends State<ExplloreScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<BlogCubit>(context).initBlog();
//   }

//   String removeHtmlTags(String htmlText) {
//     // Regular expression to match HTML tags
//     RegExp tagExp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

//     // Replace all HTML tags with an empty string
//     String cleanedText = htmlText.replaceAll(tagExp, '');

//     // Replace multiple whitespaces with a single space and trim the string
//     cleanedText = cleanedText.replaceAll(RegExp(r'\s+'), ' ').trim();

//     return cleanedText.trim().tr();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       // key: scaffoldKey,
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size(MediaQuery.of(context).size.width, 60.h),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 16, 56, 66),
//           ),
//           height: 60.h,
//           width: double.infinity,
//           alignment: Alignment.center,
//           child: Text(
//             "Explore",
//             style: MyStyle.dashTextStyle.copyWith(
//               fontSize: ScreenUtil().setSp(18),
//               fontFamily: "arial",
//               color: Colors.grey[50],
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       body: BlocBuilder<BlogCubit, BlogState>(
//         builder: (context, state) {
//           return state.loading == false
//               ? ListView.builder(
//                   itemCount: state.stories!.length,
//                   scrollDirection: Axis.vertical,
//                   padding: EdgeInsets.symmetric(vertical: 18),
//                   shrinkWrap: true,
//                   itemBuilder: (context, indexx) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 12),
//                       child: InkWell(
//                         onTap: () {
//                           print("goto");
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => DetailsExplore(state.stories![indexx]),
//                             ),
//                           );
//                         },
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Container(
//                               height: 200.h,
//                               width: ScreenUtil().screenWidth - 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.3),
//                                     spreadRadius: 0,
//                                     blurRadius: 10,
//                                     offset: Offset(0, 3),
//                                   ),
//                                 ],
//                                 image: DecorationImage(
//                                   image: NetworkImage(state.stories![indexx].imgurl.toString()),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: Container(
//                                   alignment: Alignment.bottomCenter,
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       begin: Alignment.bottomCenter,
//                                       end: Alignment.topCenter,
//                                       colors: [
//                                         Colors.black,
//                                         Colors.black.withOpacity(.3),
//                                         Colors.black.withOpacity(.1),
//                                         Colors.transparent,
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: ScreenUtil().screenWidth - 50,
//                               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                               child: Text(
//                                 state.stories![indexx].title.toString(),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18.sp,
//                                   color: Colors.black87,
//                                   height: 1.2,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: ScreenUtil().screenWidth - 50,
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               child: Text(
//                                 removeHtmlTags(state.stories![indexx].desc.toString())
//                                     .substring(0, 98),
//                                 style: TextStyle(
//                                   fontSize: 14.sp,
//                                   color: Colors.black54,
//                                   height: 1.5,
//                                 ),
//                                 maxLines: 5,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             SizedBox(height: 25.h),
//                             Container(
//                               color: Colors.grey[100],
//                               height: 25.h,
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                     // );
//                   },
//                 )
//               : Center(
//                   child: CircularProgressIndicator(),
//                 );
//         },
//       ),
//     ));
//   }
// }
class PostWidget extends StatefulWidget {
  
  PostWidget( {super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  bool isAnimating = false;
  String user = '';
 // final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // user = _auth.currentUser!.uid;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375.w,
          height: 54.h,
          color: Colors.white,
          child: Center(
            child: ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 35.w,
                  height: 35.h,
                  child: Image.asset("assets/ai.jpg"),
                ),
              ),
              title: Text(
               "simo",
                style: TextStyle(fontSize: 13.sp),
              ),
              subtitle: Text(
                "Imswane",
                style: TextStyle(fontSize: 11.sp),
              ),
              trailing: const Icon(Icons.more_horiz),
            ),
          ),
        ),
        GestureDetector(
          onDoubleTap: () {
            // Firebase_Firestor().like(
            //     like: widget.snapshot['like'],
            //     type: 'posts',
            //     uid: user,
            //     postId: widget.snapshot['postId']);
            setState(() {
              isAnimating = true;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 375.w,
                height: 375.h,
                child: 
              Image.asset("assets/AI.png")
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: isAnimating ? 1 : 0,
                child: LikeAnimation(
                  child: Icon(
                    Icons.favorite,
                    size: 100.w,
                    color: Colors.red,
                  ),
                  isAnimating: isAnimating,
                  duration: Duration(milliseconds: 400),
                  iconlike: false,
                  End: () {
                    setState(() {
                      isAnimating = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          width: 375.w,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              Row(
                children: [
                  SizedBox(width: 14.w),
                  LikeAnimation(
                    child: IconButton(
                      onPressed: () {
                        // Firebase_Firestor().like(
                        //     like: widget.snapshot['like'],
                        //     type: 'posts',
                        //     uid: user,
                        //     postId: widget.snapshot['postId']);
                      },
                      icon: Icon(
                        true
                       // widget.snapshot['like'].contains(user)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: false
                        //widget.snapshot['like'].contains(user)
                            ? Colors.red
                            : Colors.black,
                        size: 24.w,
                      ),
                    ),
                    isAnimating: true
                    //widget.snapshot['like'].contains(user),
                  ),
                  SizedBox(width: 17.w),
                  GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: DraggableScrollableSheet(
                              maxChildSize: 0.6,
                              initialChildSize: 0.6,
                              minChildSize: 0.2,
                              builder: (context, scrollController) {
                                return 
                                Comment(
                                    'posts', "www");
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                    "assets/comment.webp",
                      height: 28.h,
                    ),
                  ),
                  // SizedBox(width: 17.w),
                  // Image.asset(
                  //   "assets/AI.png",
                  //   height: 28.h,
                  // ),
                  // const Spacer(),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 15.w),
                  //   child: Image.asset(
                  //     "assets/AI.png",
                  //     height: 28.h,
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  top: 4.h,
                  bottom: 8.h,
                ),
                child: Text(
                "10",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                       "simo" +
                         " wwwwww",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 20.h, bottom: 8.h),
                child: Text(
                  "2035,07,76",
                  // formatDate(widget.snapshot['time'].toDate(),
                  //     [yyyy, '-', mm, '-', dd]),
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class LikeAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? End;
  final bool iconlike;
  const LikeAnimation({
    Key? key,
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(milliseconds: 150),
    this.End,
    this.iconlike = false,
  }) : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.isAnimating || widget.iconlike) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(
        const Duration(milliseconds: 200),
      );

      if (widget.End != null) {
        widget.End!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
class Comment extends StatefulWidget {
  String type;
  String uid;
  Comment(this.type, this.uid, {super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final comment = TextEditingController();
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool islodaing = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.r),
        topRight: Radius.circular(25.r),
      ),
      child: Container(
        color: Colors.white,
        height: 200.h,
        child: Stack(
          children: [
            Positioned(
              top: 8.h,
              left: 140.w,
              child: Container(
                width: 100.w,
                height: 3.h,
                color: Colors.black,
              ),
            ),
           
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                    
                        return CircularProgressIndicator();
                      
                      //return comment_item("dbkdjwebk");
                    },
                    itemCount:10
                        //snapshot.data == null ? 0 : snapshot.data!.docs.length,
                  ),
                ),
            
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 60.h,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45.h,
                      width: 260.w,
                      child: TextField(
                        controller: comment,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Add a comment',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          islodaing = true;
                        });
                        if (comment.text.isNotEmpty) {
                       
                        }
                        setState(() {
                          islodaing = false;
                          comment.clear();
                        });
                      },
                      child: islodaing
                          ? SizedBox(
                              width: 10.w,
                              height: 10.h,
                              child: const CircularProgressIndicator(),
                            )
                          : const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget comment_item(final snapshot) {
    return ListTile(
      leading: ClipOval(
        child: SizedBox(
          height: 35.h,
          width: 35.w,
          child: Image.asset(
            "assets/AI.png"
            //snapshot['profileImage'],
          ),
        ),
      ),
      title: Text(
        snapshot['username'],
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        snapshot['comment'],
        style: TextStyle(
          fontSize: 13.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}



