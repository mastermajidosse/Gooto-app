import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/config/save.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/models/hotel_model.dart';
import 'package:gooto/screen/allPopular_screen.dart';
import 'package:gooto/screen/audio/allAudio_screen.dart';
import 'package:gooto/screen/audio/audio.dart';
import 'package:gooto/screen/auth/fullscreenpopup.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';
import 'package:gooto/screen/feed/places_near_me.dart';
import 'package:gooto/screen/hotel/Allhotel.dart';
import 'package:gooto/screen/popular_details_screen.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCities();
  }
BlogModel city = BlogModel(
      id: 8,
      rate: 4.8,
      title: "Essaouira",
      desc:
          "<body>\n\n    <h1>Discover the Enchanting City of Essaouira</h1>\n\n    <p>Crenellated walls, special wind, houses with white and blue facades, Essaouira, the ancient Mogador, is the 'Bride of the Atlantic'. It is one of those coastal cities where the unique atmosphere and water activities seamlessly blend. Walk quietly in the shade of its ramparts, the very ones that draw the contours of Astapor, the red city of the 'Game of Thrones' series. Climb these walls and take the parapet walk, from where you can see the Purpuraires Islands, falcons, gulls, and seagulls hovering above this nature reserve. On the other side, surfers, windsurfers, and kitesurfers are taming the waves, taking advantage of the wind.</p>\n\n    <p>A walk can lead you to the fishing port where the sailors are active. Get to the fish market where you can taste the fish and seafood caught during the night. In the centre of the city, the medina invites you on a discovery wander into its winding alleys. Ranked as one of the most beautiful cities in Morocco by UNESCO, the city hums to the beat of music every summer: the <span class=\"highlight\">Gnaoua festival</span> celebrates Afro-Maghrebin rhythms, making people’s stays memorable.</p>\n\n    <p>For several years now, Morocco has adopted responsible tourism; the eco-resort Mogador, which is an unmissable place to have peaceful moments, as well as the beaches of the surroundings labeled Blue Flag, are living proofs of this ambition. Spend some time there, find complete mindfulness and serenity, in this enchanting destination that makes all your dreams come true!</p>\n\n</body>",
      imgurl:
          "https://www.visitmorocco.com/sites/default/files/styles/thumbnail_events_slider/public/thumbnails/image/essaouira-port-in-morocco-shot-after-sunset-at-blue-hour-ruslan-kalnitsky.jpg");
  Future<void> _loadCities() async {
    List<String> loadedCities = await Save.getCities();
    setState(() {
      cities = loadedCities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(

                'Places Near Me',

                style: MyStyle.blackalarmTextStyle,
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesNearMe()));
            //   },
            //   child: Container(
            //     margin: EdgeInsets.all(8),
            //     width: double.infinity,
            //     height: 200.h,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       image: DecorationImage(
            //         image: AssetImage(
            //           "assets/ai.jpg",
            //         ),
            //         fit: BoxFit.fitWidth,
            //         alignment: Alignment(0.0, -0.38),
            //       ),
            //     ),
            //   ),
            // ),
             Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: InkWell(
                onTap: () {
                  print("goto");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsExplore(city),
                    ),
                  );
                },
                child:  Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 200.h,
                      width: ScreenUtil().screenWidth - 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(city.imgurl.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.bottomCenter,
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
                          child: Container(
                            width: ScreenUtil().screenWidth - 50,
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            child: Text(
                              city.title.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                )
                
                ),
            SizedBox(height: 10),
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
                          context, MaterialPageRoute(builder: (context) => PopularPlacesScreen()));
                    },
                    child: Text(
                      'View More',
                      style: MyStyle.buttTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final CardModule card = cardsList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PopularDetailsScreen(
                            place: card,
                          ),
                        ),
                      );
                    },
                    child: CustomCards(
                      cities.contains(card.productName),
                      imageUrl: card.productImg,
                      title: card.productName,
                      description: card.location.toString(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PopularDetailsScreen(
                              place: card,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Hotels', style: MyStyle.blackalarmTextStyle),
                    Container(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => AllHotelScreen()));
                      },
                      child: Text(
                        'View More',
                        style: MyStyle.buttTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 310.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final HotelModel hotel = hotels[index];
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
                      width: 300.w,
                      padding: EdgeInsets.all(5.r),
                      margin: EdgeInsets.only(right: 5.w, left: 14.w),
                      decoration: BoxDecoration(
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
                                    fit: BoxFit.cover, image: NetworkImage(hotel.img))),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                hotel.title,
                                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                hotel.price + "/night",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on_sharp, color: Colors.redAccent),
                                  Container(
                                    width: 170.w,
                                    child: Text(
                                      hotel.location,
                                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
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
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best activities',
                    style: MyStyle.blackalarmTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            PopularActivities(),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AllActivitiesScreen()));
              },
              child: Text(
                'View More',
                style: MyStyle.buttTextStyle,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
