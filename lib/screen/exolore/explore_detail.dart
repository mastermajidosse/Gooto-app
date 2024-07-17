import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            // child: blog.id == 10
            child: HtmlWidget(
              blogModel.desc.toString(),
              renderMode: RenderMode.column,

              // set the default styling for text
              textStyle: TextStyle(fontSize: 19.sp, height: 1.3),
            ),
            //  child : Text(blog.desc.toString()),
            // child: Text(
            //   // blogModel.desc.toString(),
            //   "Located in the south of Morocco, Dakhla is a small part of paradise, lost between the waters of the Atlantic and the sands of the Sahara. It gives you a complete change of scenery. Kilometres of beaches expand from one side of the town to the other : an opportunity to relax, and indulge in all kinds of water activities.These shores are one of the most beautiful ones in Morocco. These pearls are an absolute haven of peace ; an ideal place to bask in the 25-degree sun all year round.In the surroundings, the PK25 and Foum El Bouir beaches are particularly famous. While PK25 is a perfect place for relaxation, where to swim quietly in the calm and crystalline waters of the lagoon, the atmosphere of Foum El Bouir is more lively.Being the perfect places for sliding sports : Surfers, kitesurfers and windsurfers, whether amateurs or professionals, meet here to experience thrilling challenges with waves and winds. « Pointe de Dragon » is another internationally renowned spot : waves are impressive and the most famous surfers have come in droves to these spectacular tubes that run for hundreds of metres.Leading to sub-Saharan Africa, Dakhla is a gateway to a never-ending array of thrilling and exciting activities ! ",
            //   style: TextStyle(
            //       fontSize: 19.sp,
            //       height: 1.3,
            //       color: Colors.black.withOpacity(.7)),
            //   textAlign: TextAlign.justify,
            //   // style: Mystyle.blackCatTextStyle,
            // ),
          ),
        ],
      ),
    );
  }
}