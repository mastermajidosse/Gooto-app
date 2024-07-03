import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/utils/mystyle.dart';

class AllStoriesScreen extends StatefulWidget {
  static const routeName = 'Stories';

  @override
  _AllStoriesScreenState createState() => _AllStoriesScreenState();
}

class _AllStoriesScreenState extends State<AllStoriesScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<BlogCubit>(context).initBlog();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // state.loading == false ?
          ListView.builder(
            itemCount: blogs.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 18),
            shrinkWrap: true,
            itemBuilder: (context, indexx) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => StoriesScreen(state.stories![indexx]),
                    //   ),
                    // );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 150.h,
                        width: ScreenUtil().screenWidth - 50,
                        color: Colors.grey,
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
                            ], //color: Colors.black
                            image: DecorationImage(
                              image: NetworkImage(blogs[indexx].imgurl.toString()),
                              // imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 100.w,
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
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          blogs[indexx].title.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(18),
                            color: Colors.black87,
                            height: 1,
                          ),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().screenWidth - 50,
                        alignment: Alignment.center,
                        child: Text(
                          blogs[indexx].desc.toString(),
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.black54,
                            height: 1,
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
          ),
          // : state.loading == true
          //     ? Mystyle.loadingWidget()
          //     : Center(
          //         child: Text("لا توجد قائمة"),
          //       ),
          SizedBox(height: 3),
        ],
      ),
    ));
  }

  List<BlogModel> blogs = [
    BlogModel(
        id: 4,
        title: "Dakhla",
        desc:
            "Located in the south of Morocco, Dakhla is a small part of paradise, lost between the waters of the Atlantic and the sands of the Sahara. It gives you a complete change of scenery. Kilometres of beaches expand from one side of the town to the other : an opportunity to relax, and indulge in all kinds of water activities.",
        imgurl:
            "https://www.visitmorocco.com/sites/default/files/thumbnails/image/adonet.fr___11.-Les-meilleurs-plages-%C3%A0-visiter-pendant-votre-s%C3%A9jour-%C3%A0-Agadir.jpg"),
    BlogModel(
        id: 2,
        title: "Ifran",
        desc:
            "With its clean air, scrubbed streets, red-roofed houses, white winters, and being set high up in Atlas mountains, Ifrane is a go-to destination !",
        imgurl: "https://www.visitmorocco.com/sites/default/files/thumbnails/image/ifrane-lac.jpg"),
    BlogModel(
        id: 1,
        title: "Agadir-Taghazout",
        desc: "dkodkspokd",
        imgurl:
            "https://www.visitmorocco.com/sites/default/files/thumbnails/image/Catamaran_0.jpg"),
    BlogModel(
        id: 3,
        title: "Essaouira",
        desc: "dkodkspokd",
        imgurl:
            "https://www.visitmorocco.com/sites/all/themes/custom/onmt_theme/assets/images/patterns-white.png"),
  ];
}
