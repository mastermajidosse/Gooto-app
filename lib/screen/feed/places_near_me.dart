// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:gooto/screen/auth/splash_screen.dart';
// //import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:gooto/utils/mystyle.dart';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:geocoding/geocoding.dart';

// class PlacesNearMe extends StatefulWidget {
//   const PlacesNearMe({super.key});

//   @override
//   State<PlacesNearMe> createState() => _PlacesNearMeState();
// }

// class _PlacesNearMeState extends State<PlacesNearMe> {
//   List<Map<String, dynamic>> restaurantse = [];
//   // void _startNotificationScheduler(String name) {
//   //   Timer.periodic(const Duration(seconds: 1), (timer) {
//   //     final now = DateTime.now();
//   //     final isWithinRange1 = now.hour >= 8 && now.hour < 11;
//   //     final isWithinRange2 = now.hour >= 14 && now.hour < 18;
//   //     final isWithinRange3 = now.hour >= 19 && now.hour < 22;

//   //     if (isWithinRange1 || isWithinRange2 || isWithinRange3) {
//   //       Notififcation(name);
//   //        timer.cancel();
//   //     }
//   //   });
//   // }

//   String apiKey = 'AIzaSyAvQpJOpHxD5akNd5nIMvVKvSR2OKrLlKk';
//   int radius = 1000;
//   static const type = 'restaurant';
//   String? contributorUrl;
//   late bool serviceEnabled;
//   late LocationPermission permission;
//   @override
//   void initState() {
//     // AwesomeNotifications().isNotificationAllowed().then((value) {
//     //   if (!value) {
//     //     AwesomeNotifications().requestPermissionToSendNotifications();
//     //   }

//     resto();
//     // });

//     super.initState();
//   }

//   // void Notififcation(name) {
//   //   AwesomeNotifications().createNotification(
//   //       content: NotificationContent(

//   //           id: 10,
//   //           channelKey: 'basic_channel',
//   //           title: 'Name: $name ',
//   //           body: 'gooto'));
//   // }

//   void resto() async {
//     const apiKey = 'AIzaSyAvQpJOpHxD5akNd5nIMvVKvSR2OKrLlKk';
//     const radius = 1000;
//     const type = 'restaurant';
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     print("--------------------------");
//     var loc = await Geolocator.getCurrentPosition();
//     var loca = "${loc.latitude},${loc.longitude}";
//     print(loca);

//     // Construct the URL
//     var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
//         '?location=$loca&radius=$radius&type=$type&key=$apiKey';

//     // Make the request
//     final response = await http.get(Uri.parse(url));

//     // Parse the response
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final restaurants = (data['results'] as List).map((place) {
//         return {
//           'name': place['name'],
//           'location': {
//             'lat': place['geometry']['location']['lat'],
//             'lng': place['geometry']['location']['lng'],
//           },
//           'photo': place['photos'][0]['photo_reference'],
//           'rating': place['rating'],
//           'Link': place['photos'][0]['html_attributions'],
// //           'opening_hours':
// //  place['opening_hours']
//           'opening_hours': place['opening_hours']
//         };
//       }).toList();

//       // if (restaurants.isNotEmpty) {
//       int random = Random().nextInt(restaurants.length);
//       // _startNotificationScheduler(restaurants[random]['name']);
//       // Notififcation(restaurants[random]['name']);
//       //}
//       // Print the results
//       for (var restaurant in restaurants) {
//         String photoUrl =
//             'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${restaurant['photo']}&key=$apiKey';
//         print('Name: ${restaurant['name']}, '
//             'Location: (${restaurant['location']['lat']}, ${restaurant['location']['lng']})'
//             'Photo URL: $photoUrl\n');
//         restaurantse.add(restaurant);
//       }
//       setState(() {
//         restaurantse = restaurants;
//       });
//     } else {
//       print('Error: ${response.statusCode}, ${response.body}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Align(
//           alignment: Alignment.center,
//           child: Text(
//             "Suggestion Ai",
//             textAlign: TextAlign.center,
//           ),
//         )),
//         body: restaurantse.isEmpty
//             ? SplashScreen(radius: 50.5)
//             : Container(
//                 //height: 310.h,
//                 // color: Colors.green,
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: restaurantse.length,
//                   itemBuilder: (context, index) {
//                     final restaurant = restaurantse[index];
//                     // return CustomCard(card: card);
//                     return GestureDetector(
//                       onTap: () async {
//                         //                   var htmlData=restaurant['Link'];
//                         //                       RegExp regex = RegExp(r'href="(.*?)"');
//                         // Match? match = regex.firstMatch(htmlData);
//                         // if (match != null) {
//                         //   contributorUrl = match.group(1);
//                         // } else {
//                         //   contributorUrl = null;
//                         // }
//                         if (!await launchUrl(Uri.parse(
//                             'https://www.google.com/maps?q=${restaurant['location']['lat']},${restaurant['location']['lng']}'))) {
//                           throw Exception('Could not launch ${restaurant['Link']}');
//                         }

//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => FullScreenPop(
//                         //               hotel: hotel,
//                         //             )));
//                       },
//                       child: Container(
//                         // height: 320.h,
//                         width: 300.w,
//                         padding: EdgeInsets.all(5.r),
//                         // padding: EdgeInsets.all(14.r),
//                         margin: EdgeInsets.only(right: 5.w, left: 14.w),
//                         decoration: BoxDecoration(
//                           // color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(22.r),
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 200.h,
//                               decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                   borderRadius: BorderRadius.circular(22.r),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: NetworkImage(
//                                           'https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=${restaurant['photo']}&key=$apiKey'))),
//                             ),
//                             SizedBox(height: 10.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   restaurant['name'],
//                                   style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.star, color: Colors.amber),
//                                     Text(
//                                       restaurant['rating'].toString(),
//                                       style: TextStyle(color: Colors.grey),
//                                     )
//                                   ],
//                                 ),
//                                 // Text(
//                                 //   '${restaurant['opening_hours']}',
//                                 //   // ?'Open'
//                                 //   // :'Close',
//                                 //   style: TextStyle(fontSize: 14.sp),
//                                 // ),
//                               ],
//                             ),
//                             SizedBox(height: 6.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(Icons.location_on_sharp, color: Colors.redAccent),
//                                     FutureBuilder<String>(
//                                       future: getStreetAddress(restaurant['location']['lat'],
//                                           restaurant['location']['lng']),
//                                       builder: (context, snapshot) {
//                                         if (snapshot.hasData) {
//                                           return Container(
//                                             width: 200.w,
//                                             child: Text(
//                                               '${snapshot.data!}',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12.sp,
//                                               ),
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           );
//                                         } else if (snapshot.hasError) {
//                                           return Container(
//                                             width: 170.w,
//                                             child: Text(
//                                               'Error getting address',
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 12.sp,
//                                               ),
//                                             ),
//                                           );
//                                         } else {
//                                           return Container(
//                                             width: 170.w,
//                                             child: CircularProgressIndicator(),
//                                           );
//                                         }
//                                       },
//                                     )
//                                     // Container(
//                                     //   width: 170.w,
//                                     //   child: Text(
//                                     //     getStreetAddress(restaurant['location']['lat'][index], restaurant['location']['lng'][index]).toString(),
//                                     //     style: TextStyle(
//                                     //         color: Colors.grey, fontSize: 12.sp),
//                                     //   ),
//                                     // )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                     // CustomCards(
//                     //   cities.contains(card.name),
//                     //   imageUrl: card.logo,
//                     //   title: card.name,
//                     //   description: card.desc,
//                     //   onTap: () {
//                     //     if (cities.contains(card.name)) {
//                     //       _removeCity(card.name);
//                     //     } else {
//                     //       _addCity(card.name);
//                     //     }
//                     //   },
//                     // );
//                   },
//                 ),
//               ));

//     // Padding(
//     //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//     //   child: Column(
//     //     children: [
//     //       Row(
//     //         children: [
//     //           Text(
//     //             'Places Near Me',
//     //             style: MyStyle.blackalarmTextStyle,
//     //           ),
//     //         ],
//     //       ),
//     //       SizedBox(
//     //         height: 16.h,
//     //       ),
//     //       Container(
//     //         height: 250.h,
//     //         child: ListView.builder(
//     //           scrollDirection: Axis.horizontal,
//     //           itemCount: restaurantse.length,
//     //           itemBuilder: (context, index) {
//     //             final restaurant = restaurantse[index];
//     //             return Container(
//     //               width: 200.w,
//     //               // height: 100.h,
//     //               margin: EdgeInsets.symmetric(horizontal: 10.w),
//     //               decoration: BoxDecoration(
//     //                   // color: Colors.grey[200],
//     //                   ),
//     //               child: Column(
//     //                 children: [
//     //                   Container(
//     //                     width: double.infinity,
//     //                     height: 150.h,
//     //                     decoration: BoxDecoration(
//     //                         color: Colors.grey,
//     //                         image: DecorationImage(
//     //                           fit: BoxFit.cover,
//     //                           image: NetworkImage(
//     //                               'https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=${restaurant['photo']}&key=$apiKey'),
//     //                         ),
//     //                         borderRadius: BorderRadius.circular(25.r)),
//     //                   ),
//     //                   SizedBox(height: 10.h),
//     //                   Text(
//     //                     restaurant['name'],
//     //                     style: TextStyle(
//     //                         fontWeight: FontWeight.w400, fontSize: 16.sp),
//     //                   ),
//     //                 ],
//     //               ),
//     //             );

//     //             // return ListTile(
//     //             //   leading: restaurant['photo'] != null
//     //             //       ? Image.network(
//     //             //           'https://maps.googleapis.com/maps/api/place/photo?maxwidth=100&photoreference=${restaurant['photo']}&key=$apiKey',
//     //             //           width: 50,
//     //             //           height: 50,
//     //             //           fit: BoxFit.cover,
//     //             //         )
//     //             //       : const SizedBox(
//     //             //           width: 50,
//     //             //           height: 50,
//     //             //           child: Text("rab"),
//     //             //         ),
//     //             //   title: Text(restaurant['name']),
//     //             //   subtitle: Text(
//     //             //     'Latitude: ${restaurant['location']['lat']}, Longitude: ${restaurant['location']['lng']}',
//     //             //   ),
//     //             // );
//     //           },
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }

//   Future<String> getStreetAddress(double lat, double lng) async {
//     try {
//       // Convert the latitude and longitude to a list of Placemark objects
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

//       // Get the first Placemark object, which should contain the most detailed address information
//       Placemark placemark = placemarks.first;

//       // Construct the street address from the Placemark information
//       String streetAddress =
//           "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}";

//       return streetAddress;
//     } catch (e) {
//       // Handle any errors that occur during the geocoding process
//       print('Error getting street address: $e');
//       return 'Unable to get street address';
//     }
//   }

//   Widget buildRestaurantCard(restaurant) {
//     return GestureDetector(
//       onTap: () async {
//         if (!await launchUrl(Uri.parse(
//             'https://www.google.com/maps?q=${restaurant['location']['lat']},${restaurant['location']['lng']}'))) {
//           throw Exception('Could not launch ${restaurant['Link']}');
//         }
//       },
//       child: Container(
//         width: 300.w,
//         padding: EdgeInsets.all(5.r),
//         margin: EdgeInsets.only(right: 5.w, left: 14.w),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22.r),
//         ),
//         child: Column(
//           children: [
//             Container(
//               height: 200.h,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(22.r),
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                     'https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=${restaurant['photo']}&key=$apiKey',
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   restaurant['name'],
//                   style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.amber),
//                     Text(
//                       restaurant['rating'].toString(),
//                       style: TextStyle(color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 6.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.location_on_sharp, color: Colors.redAccent),
//                     FutureBuilder<String>(
//                       future: getStreetAddress(
//                           restaurant['location']['lat'], restaurant['location']['lng']),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return Container(
//                             width: 200.w,
//                             child: Text(
//                               '${snapshot.data!}',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 12.sp,
//                               ),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           );
//                         } else if (snapshot.hasError) {
//                           return Container(
//                             width: 170.w,
//                             child: Text(
//                               'Error getting address',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 12.sp,
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Container(
//                             width: 170.w,
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                       },
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
