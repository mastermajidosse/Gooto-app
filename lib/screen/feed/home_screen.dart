import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
import 'package:gooto/config/save.dart';
import 'package:gooto/models/audio_model.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/models/hotel_model.dart';
import 'package:gooto/screen/allPopular_screen.dart';
import 'package:gooto/screen/audio/allAudio_screen.dart';
import 'package:gooto/screen/audio/audio.dart';
import 'package:gooto/screen/auth/fullscreenpopup.dart';
import 'package:gooto/widgets/all_activities_screen.dart';
import 'package:gooto/widgets/custm_card.dart';
import 'package:gooto/widgets/popular_activities.dart';

import '../../config/demo.dart';
import '../../utils/MyStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> cities = [];
  Future<void> _addCity(String city) async {
    setState(() {
      cities.add(city);
    });
    await Save.saveCities(cities);
  }

  Future<void> _removeCity(String city) async {
    setState(() {
      cities.remove(city);
    });
    await Save.saveCities(cities);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    List<String> loadedCities = await Save.getCities();
    setState(() {
      cities = loadedCities;
    });
  }

  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       // width: 45,
            //       // height: 45,
            //       margin: EdgeInsets.all(8),
            //       child: Text(
            //         'Discover',
            //         style: MyStyle.blackalarmTextStyle,
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.all(8),
            //       width: 45,
            //       height: 45,
            //       child: IconButton(
            //         color: Colors.black,
            //         onPressed: () {},
            //         icon: Icon(
            //           Icons.search,
            //         ),
            //       ),

            //     ),
            //   ],
            // ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'the Moroccan Switzerland :',
                style: MyStyle.buttwhtieTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/ifran.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Places',
                    style: MyStyle.blackalarmTextStyle,
                  ),
                  Container(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopularPlacesScreen()));
                    },
                    child: Text(
                      'View More',
                      style: MyStyle.buttTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 380.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final CardModule card = cardsList[index];
                  // return CustomCard(card: card);
                  return CustomCards(
                    cities.contains(card.productName),
                    imageUrl: card.productImg,
                    title: card.productName,
                    description: card.location.toString(),
                    onTap: () {
                      if (cities.contains(card.productName)) {
                        _removeCity(card.productName);
                      } else {
                        _addCity(card.productName);
                      }
                    },
                  );
                },
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Listen', style: MyStyle.blackalarmTextStyle
            //           //                  TextStyle(
            //           // fontWeight: FontWeight.bold,
            //           // fontSize: ScreenUtil().setSp(17),
            //           // color: Colors.black87,
            //           //                   )  //MyStyle.blackalarmTextStyle,
            //           ),
            //       Container(),
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context, MaterialPageRoute(builder: (context) => AllaudioScreen()));
            //         },
            //         child: Text(
            //           'View More',
            //           style: MyStyle.buttTextStyle,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 320.h,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       final AudioModel card = audio[index];
            //       // return CustomCard(card: card);
            //       return Container(
            //         height: 320.h,
            //         width: 200.w,
            //         margin: EdgeInsets.all(16),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(16),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.3),
            //               spreadRadius: 2,
            //               blurRadius: 10,
            //               offset: Offset(0, 3),
            //             ),
            //           ],
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Stack(
            //               children: [
            //                 ClipRRect(
            //                   borderRadius: BorderRadius.circular(16),
            //                   child: Image.asset(
            //                     card.logo,
            //                     width: double.infinity,
            //                     height: 120.h,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //                 Positioned(
            //                   top: 10,
            //                   right: 10,
            //                   child: InkWell(
            //                     onTap: () => {
            //                       //     if (cities.contains(card.name)) {
            //                       //       _removeCity(card.name);
            //                       //     } else {
            //                       //       _addCity(card.name);
            //                       //     }
            //                       //   },
            //                     },
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         shape: BoxShape.circle,
            //                         boxShadow: [
            //                           BoxShadow(
            //                             color: Colors.black.withOpacity(0.3),
            //                             spreadRadius: 2,
            //                             blurRadius: 10,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Padding(
            //               padding: EdgeInsets.all(16),
            //               child: Text(
            //                 card.name,
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 13.sp,
            //                   color: Colors.black87,
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 16),
            //               child: Text(
            //                 card.flagname,
            //                 style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black54,
            //                   height: 1.5,
            //                 ),
            //                 maxLines: 2,
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 GestureDetector(
            //                     onTap: () {
            //                       Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => AudioPlayerScreen(
            //                                   card.photos, card.name, card.audio, card.desc)));
            //                     },
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                         color: Colors.black,
            //                         borderRadius: BorderRadius.circular(16.0),
            //                       ),
            //                       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            //                       child: Row(
            //                         mainAxisSize: MainAxisSize.min,
            //                         children: [
            //                           Icon(
            //                             Icons.music_note_outlined,
            //                             color: Colors.white,
            //                           ),
            //                           SizedBox(width: 8.0),
            //                           Text(
            //                             "Play now",
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               fontWeight: FontWeight.normal,
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ))
            //               ],
            //             )
            //           ],
            //         ),
            //       );
            //       // CustomCards(
            //       //   cities.contains(card.name),
            //       //   imageUrl: card.logo,
            //       //   title: card.name,
            //       //   description: card.desc,
            //       //   onTap: () {
            //       //     if (cities.contains(card.name)) {
            //       //       _removeCity(card.name);
            //       //     } else {
            //       //       _addCity(card.name);
            //       //     }
            //       //   },
            //       // );
            //     },
            //   ),
            // ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hotels', style: MyStyle.blackalarmTextStyle
                        //                  TextStyle(
                        // fontWeight: FontWeight.bold,
                        // fontSize: ScreenUtil().setSp(17),
                        // color: Colors.black87,
                        //                   )  //MyStyle.blackalarmTextStyle,
                        ),
                    Container(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllaudioScreen()));
                      },
                      child: Text(
                        'View More',
                        style: MyStyle.buttTextStyle,
                      ),
<<<<<<< HEAD
                  Container(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllaudioScreen()));
                    },
                    child: Text(
                      'View More',
                      style: MyStyle.buttTextStyle,
=======
>>>>>>> origin/booknow
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 310.h,
              // color: Colors.green,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final HotelModel hotel = hotels[index];
                  // return CustomCard(card: card);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreenPop(
                                    hotel: hotel,
                                  )));
                    },
                    child: Container(
                      // height: 320.h,
                      width: 300.w,
                      padding: EdgeInsets.all(5.r),
                      // padding: EdgeInsets.all(14.r),
                      margin: EdgeInsets.only(right: 5.w, left: 14.w),
                      decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(22.r),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(22.r),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(hotel.img))),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                hotel.title,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                hotel.price + "/night",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
<<<<<<< HEAD
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AudioPlayerScreen(
                                                  card.photos,
                                                  card.name,
                                                  card.audio,
                                                  card.desc)));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.music_note_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        "Play now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
=======
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on_sharp,
                                      color: Colors.redAccent),
                                  Container(
                                    width: 170.w,
                                    child: Text(
                                      hotel.location,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  Text(
                                    hotel.rating.toString(),
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
>>>>>>> origin/booknow
                    ),
                  );
                  // CustomCards(
                  //   cities.contains(card.name),
                  //   imageUrl: card.logo,
                  //   title: card.name,
                  //   description: card.desc,
                  //   onTap: () {
                  //     if (cities.contains(card.name)) {
                  //       _removeCity(card.name);
                  //     } else {
                  //       _addCity(card.name);
                  //     }
                  //   },
                  // );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best activities',
                    style: MyStyle.blackalarmTextStyle,
                  ),
                  // Container(),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            PopularActivities(),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllActivitiesScreen()));
              },
              child: Text(
                'View More',
                style: MyStyle.buttTextStyle,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
