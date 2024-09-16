import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/config/save.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/models/hotel_model.dart';
import 'package:gooto/screen/allPopular_screen.dart';
import 'package:gooto/screen/audio/allAudio_screen.dart';
import 'package:gooto/screen/audio/audio.dart';
import 'package:gooto/screen/auth/fullscreenpopup.dart';
import 'package:gooto/screen/feed/places_near_me.dart';
import 'package:gooto/screen/hotel/Allhotel.dart';
import 'package:gooto/screen/popular_details_screen.dart';
import 'package:gooto/screen/together.dart';
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
   static changeLanguge(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'AE'));
    } else if(currentLocal == const Locale('ar', 'AE')) {
      EasyLocalization.of(context)!.setLocale(const Locale('fr', 'FR'));
    }else{
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }


  }

  Future<void> _loadCities() async {
    List<String> loadedCities = await Save.getCities();
    setState(() {
      cities = loadedCities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(
                  onPressed: () {
                   changeLanguge(context);
                  },
                  icon: const Icon(Icons.language)),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Together'.tr(),
                style: MyStyle.blackalarmTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Together()));
              },
              child: Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/ai.jpg",
                    ),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment(0.0, -0.38),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Places'.tr(),
                    style: MyStyle.blackalarmTextStyle,
                  ),
                  Container(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PopularPlacesScreen()));
                    },
                    child: Text(
                      'View More'.tr(),
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
                itemCount: 6,
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
                      cities.contains(card.productName.tr()),
                      imageUrl: card.productImg,
                      title: card.productName.tr(),
                      description: card.location.toString().tr(),
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
                    Text('Best Hotels'.tr(), style: MyStyle.blackalarmTextStyle),
                    Container(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => AllHotelScreen()));
                      },
                      child: Text(
                        'View More'.tr(),
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
                                      hotel.location.tr(),
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
                    'Best activities'.tr(),
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
                'View More'.tr(),
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
