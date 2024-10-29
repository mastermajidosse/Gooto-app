import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/bloc/blog/blog_cubit.dart';
import 'package:gooto/config/demo.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/posts.model.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';
import 'package:gooto/services/api/getdata.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:readmore/readmore.dart';


class PostWidget extends StatefulWidget {
  
  PostWidget( {super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  bool isAnimating = false;
  String user = '';
  Color iconColor = Colors.black54;
  int numberlikes=0;
 // final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // user = _auth.currentUser!.uid;
  }
   Posts? currentlyLikedPost; // Track the currently liked post
  void _toggleLike(Posts post) {
    setState(() {
      // Toggle the like state for the current post
      if (post.iconColor == Colors.black54) {
        post.Like += 1; // Increment likes
        post.iconColor = Colors.blue; // Change icon color to blue
      } else {
        post.Like -= 1; // Decrement likes
        post.iconColor = Colors.black54; // Reset icon color to black
      }
    }
    );
  }
  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//    actions: [
//           // IconButton(
//           //   icon: Icon(Icons.add), // Notification icon
//           //   onPressed: () {
//           //     // Handle notification icon press
//           //     ScaffoldMessenger.of(context).showSnackBar(
//           //       SnackBar(content: Text('')),
//           //     );
//           //   },
//           // ),
//         ],
// centerTitle: true,
//         title: Text("Share experience"),
//       ) ,
//    body:  SingleChildScrollView(
//    child:Container(
//     height: 700.h,
//  // children: [
//   child:  ListView.builder(
//     scrollDirection: Axis.vertical,
//     itemCount: Listposts.length,
//     itemBuilder: (context,index){
//       Posts post=Listposts[index];
//       numberlikes=post.Like!;
// return Column(
//       children: [
//         // ListView.builder(
//         //   scrollDirection: Axis.horizontal,
//         //   itemCount: 6,
//         //   itemBuilder: (context, index) {

       
//         Container(
//           width: 375.w,
//           height: 54.h,
//           color: Colors.white,
//           child: Center(
//             child: ListTile(
//               leading: ClipOval(
//                 child: SizedBox(
//                   width: 35.w,
//                   height: 35.h,
//                   child: Image.asset(post.imageprofile!),
//                 ),
//               ),
//               title: Text(
//                post.name!,
//                 style: TextStyle(fontSize: 13.sp),
//               ),
//               subtitle: Text(
//                 post.local!,
//                 style: TextStyle(fontSize: 11.sp),
//               ),
//               trailing: const Icon(Icons.more_horiz),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onDoubleTap: () {
//             // Firebase_Firestor().like(
//             //     like: widget.snapshot['like'],
//             //     type: 'posts',
//             //     uid: user,
//             //     postId: widget.snapshot['postId']);
//             setState(() {
//               isAnimating = true;
//             });
//           },
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: 375.w,
//                 height: 375.h,
//                 child: 
//               Image.asset(post.image!,fit: BoxFit.cover,)
//               ),
//               AnimatedOpacity(
//                 duration: Duration(milliseconds: 200),
//                 opacity: isAnimating ? 1 : 0,
//                 child: LikeAnimation(
//                   child: 
//                    Image.asset(
//           // _selectedIndex == numb ? img : txt,
//          "assets/icons/like1.png",
//           width:  120.w,
//           color:  Colors.blue,
//         ),
//                   // Icon(
//                   //   Icons.favorite,
//                   //   size: 100.w,
//                   //   color: Colors.red,
//                   // ),
//                   isAnimating: isAnimating,
//                   duration: Duration(milliseconds: 400),
//                   iconlike: false,
//                   End: () {
//                     setState(() {
//                       isAnimating = false;
//                     });
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           width: 375.w,
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 14.h),
//               Row(
//                 children: [
//                   SizedBox(width: 14.w),
//                   GestureDetector(
//                       onTap: (){_toggleLike(post);},
                      
//              child:
//              LikeAnimation(
                    
//                   child:   Image.asset(
//           // _selectedIndex == numb ? img : txt,
//          "assets/icons/like1.png",
//           width:  50.w,
//           color:  post.iconColor,
//         ),
                 
//                     // IconButton(
//                     //   onPressed: () {
//                     //     // Firebase_Firestor().like(
//                     //     //     like: widget.snapshot['like'],
//                     //     //     type: 'posts',
//                     //     //     uid: user,
//                     //     //     postId: widget.snapshot['postId']);
//                     //   },
//                     //   icon: Icon(
//                     //     true
//                     //    // widget.snapshot['like'].contains(user)
//                     //         ? Icons.favorite
//                     //         : Icons.favorite_border,
//                     //     color: false
//                     //     //widget.snapshot['like'].contains(user)
//                     //         ? Colors.red
//                     //         : Colors.black,
//                     //     size: 24.w,
//                     //   ),
//                     // ),
//                     isAnimating: true
//                     //widget.snapshot['like'].contains(user),
//                   ),
//                    ),
//                   SizedBox(width: 17.w),
//                   GestureDetector(
//                     onTap: () {
//                       showBottomSheet(
//                         backgroundColor: Colors.transparent,
//                         context: context,
//                         builder: (context) {
//                           return Padding(
//                             padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).viewInsets.bottom,
//                             ),
//                             child: DraggableScrollableSheet(
//                               maxChildSize: 0.6,
//                               initialChildSize: 0.6,
//                               minChildSize: 0.2,
//                               builder: (context, scrollController) {
//                                 return 
//                                 Comment(
//                                     'posts', "www");
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     child: Image.asset(
//                     "assets/comment.webp",
//                       height: 28.h,
//                     ),
//                   ),
//                   // SizedBox(width: 17.w),
//                   // Image.asset(
//                   //   "assets/AI.png",
//                   //   height: 28.h,
//                   // ),
//                   // const Spacer(),
//                   // Padding(
//                   //   padding: EdgeInsets.only(right: 15.w),
//                   //   child: Image.asset(
//                   //     "assets/AI.png",
//                   //     height: 28.h,
//                   //   ),
//                   // ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 30.w,
//                   top: 4.h,
//                   bottom: 8.h,
//                 ),
//                 child: Text(
//                 numberlikes.toString(),
//                   style: TextStyle(
//                     fontSize: 13.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15.w),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                        post.name! +
//                          " ${post.description}",
//                         style: TextStyle(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 15.w, top: 20.h, bottom: 8.h),
//                 child: Text(
//                   "",
//                   // formatDate(widget.snapshot['time'].toDate(),
//                   //     [yyyy, '-', mm, '-', dd]),
//                   style: TextStyle(fontSize: 11.sp, color: Colors.grey),
//                 ),
//               ),
//             ],
//           )
//         )
//       ]
// );
//     }
//    )
//   //]
//         )
//        //  })
  
//    )
//     );
 final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 600 ? 600.0 : screenWidth * 0.9;

    return Scaffold(
      backgroundColor: Colors.white,
     appBar:  AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow icon
        onPressed: () {
          Navigator.of(context).pop(); // Go back to the previous screen
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the title
        children: [
          Image.asset("assets/icon.png", height: 40), // Logo or image in the center
        ],
      ),
      actions: [
        // You can include additional actions here if needed
        SizedBox(width: 48), // Spacer to balance the action items
      ],
    ),
  body: ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: Listposts.length, // Assuming Listposts is a List
    itemBuilder: (context, index) {
      final post = Listposts[index]; // Assuming post contains the necessary data for each card

      return 
      // Center(
        
      //   child: 
        // Card(
          
        //   elevation: 4,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //   child:
           Container(
            
            // height: ,

decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(18)),
            width: 400.w,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Model 
                // Row(
                //   children: [
                //     Icon(Icons.favorite, size: 16, color: Colors.grey[600]),
                //     const SizedBox(width: 8),
                //     Text(
                //       'liked', // Assuming likedBy is a property of post
                //       style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundImage: AssetImage(post.imageprofile!), // Assuming avatarUrl is a property of post
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                post.name!, // Assuming authorName is a property of post
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),
                              ),
                              Text(
                                '${post.local!} · ${post.time}', // Assuming username and timestamp are properties of post
                                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // Text(
                          //   post.description!, // Assuming content is a property of post
                          //   style: TextStyle(fontSize: 17,color: Colors.black),
                          // ),
                          ReadMoreText(
              post.description!,
              trimMode: TrimMode.Line,
              trimLines: 3,
              colorClickableText: Colors.blue,
              trimCollapsedText: 'Show more'.tr(),
              trimExpandedText: 'Show less'.tr(),
              style: TextStyle(fontSize: 17,color: Colors.black),
              moreStyle: TextStyle(color: Colors.blue),
            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconWithCount(Icons.star, post.Rating.toString(), Colors.amber), // Assuming starCount is a property of post
                    _buildIconWithCount(Icons.favorite_border, post.Like.toString(), Colors.grey[600]), // Assuming favoriteCount is a property of post
                    Icon(Icons.share, color: Colors.grey[600]),
                  ],
                ),
                SizedBox(height: 10.h,),
                Divider(
  color: Colors.grey, 
  thickness: 0.5, 
)
              ],
            ),
          );
      //  ),
     // );
    },
  ),
);

  }

  Widget _buildIconWithCount(IconData icon, String count,Color? c) {
    return Row(
      children: [
        Icon(icon, color: c== null ?Colors.grey[600]:c),
        const SizedBox(width: 4),
        Text(count, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}

//   }
// }
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
                    
                        return Center(child: Text("No comments"));
                      
                      //return comment_item("dbkdjwebk");
                    },
                    itemCount:1
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



