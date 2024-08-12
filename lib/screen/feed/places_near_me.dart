// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:gooto/screen/auth/splash_screen.dart';
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

//   String apiKey = 'AIzaSyAvQpJOpHxD5akNd5nIMvVKvSR2OKrLlKk';
//   int radius = 1000;
//   static const type = 'restaurant';
//   String? contributorUrl;
//   late bool serviceEnabled;
//   late LocationPermission permission;
//   @override
//   void initState() {
//     resto();
//     super.initState();
//   }

//   void resto() async {
//     const apiKey = 'AIzaSyAvQpJOpHxD5akNd5nIMvVKvSR2OKrLlKk';
//     const radius = 1000;
//     const type = 'restaurant';
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
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
//           'opening_hours': place['opening_hours']
//         };
//       }).toList();

//       int random = Random().nextInt(restaurants.length);

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
//                     return GestureDetector(
//                       onTap: () async {
//                         if (!await launchUrl(Uri.parse(
//                             'https://www.google.com/maps?q=${restaurant['location']['lat']},${restaurant['location']['lng']}'))) {
//                           throw Exception(
//                               'Could not launch ${restaurant['Link']}');
//                         }
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
//                                   style: TextStyle(
//                                       fontSize: 17.sp,
//                                       fontWeight: FontWeight.w600),
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
//                               ],
//                             ),
//                             SizedBox(height: 6.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(Icons.location_on_sharp,
//                                         color: Colors.redAccent),
//                                     FutureBuilder<String>(
//                                       future: getStreetAddress(
//                                           restaurant['location']['lat'],
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
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ));
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
//                   style:
//                       TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
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
//                       future: getStreetAddress(restaurant['location']['lat'],
//                           restaurant['location']['lng']),
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
