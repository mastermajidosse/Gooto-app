// import 'package:flutter/material.dart';

// class Suggestionai extends StatefulWidget {
//   const Suggestionai({super.key});

//   @override
//   State<Suggestionai> createState() => _SuggestionaiState();
// }

// class _SuggestionaiState extends State<Suggestionai> {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
            
//               height: 310.h,
//               // color: Colors.green,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: hotels.length,
//                 itemBuilder: (context, index) {
//                   final HotelModel hotel = hotels[index];
//                   // return CustomCard(card: card);
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => FullScreenPop(
//                                     hotel: hotel,
//                                   )));
//                     },
//                     child: Container(
//                       // height: 320.h,
//                       width: 300.w,
//                       padding: EdgeInsets.all(5.r),
//                       // padding: EdgeInsets.all(14.r),
//                       margin: EdgeInsets.only(right: 5.w, left: 14.w),
//                       decoration: BoxDecoration(
//                         // color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(22.r),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 200.h,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(22.r),
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: NetworkImage(hotel.img))),
//                           ),
//                           SizedBox(height: 10.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 hotel.title,
//                                 style: TextStyle(
//                                     fontSize: 17.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               Text(
//                                 hotel.price + "/night",
//                                 style: TextStyle(fontSize: 14.sp),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 6.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Icon(Icons.location_on_sharp,
//                                       color: Colors.redAccent),
//                                   Container(
//                                     width: 170.w,
//                                     child: Text(
//                                       hotel.location,
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 12.sp),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(Icons.star, color: Colors.amber),
//                                   Text(
//                                     hotel.rating.toString(),
//                                     style: TextStyle(color: Colors.grey),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                   // CustomCards(
//                   //   cities.contains(card.name),
//                   //   imageUrl: card.logo,
//                   //   title: card.name,
//                   //   description: card.desc,
//                   //   onTap: () {
//                   //     if (cities.contains(card.name)) {
//                   //       _removeCity(card.name);
//                   //     } else {
//                   //       _addCity(card.name);
//                   //     }
//                   //   },
//                   // );
//                 },
//               ),
//             ),;
//   }
// }