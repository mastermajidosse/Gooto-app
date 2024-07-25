import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gooto/config/save.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/screen/allPopular_screen.dart';
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
            Gap(10),
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
            Gap(15),
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
