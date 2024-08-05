import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/config/demo.dart';
import 'package:gooto/models/audio_model.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/screen/audio/audio.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';
import 'package:gooto/utils/mystyle.dart';
import 'package:gooto/widgets/popular_activities.dart';

class PodcastDiscoveryScreen extends StatefulWidget {
  @override
  _PodcastDiscoveryScreenState createState() => _PodcastDiscoveryScreenState();
}

class _PodcastDiscoveryScreenState extends State<PodcastDiscoveryScreen> {
  TextEditingController _searchController = TextEditingController();
  List<AudioModel> _filteredItems = [];
  @override
  void initState() {
    super.initState();
    _filteredItems = audio;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = audio.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Audio General',
            textAlign: TextAlign.center,
          ),
        )),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          primary: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Best Audio Stories🎤',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Cities 🔥', style: MyStyle.blackalarmTextStyle
                      //     TextStyle(
                      //     fontFamily: 'Arial',
                      // fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      // color: Colors.black,
                      //     ),
                      ),
                  Container(),

                  //   InkWell(
                  //     onTap: () {
                  //       // Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //         builder: (context) => PopularPlacesScreen()));
                  //     },
                  //     child: Text(
                  //       'View More',
                  //       style: TextStyle(
                  //     fontFamily: 'Arial',
                  // fontSize: 16,
                  // fontWeight: FontWeight.bold,
                  // color: Colors.blue,
                  //     ),
                  //     ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
                width: 400,
                height: 200,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final AudioModel Audio = audio[index];
                      return InkWell(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 380,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Audio.color,
                          ),
                          child: Row(
                            children: [
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 12, top: 7),
                                    child: Text(
                                      Audio.name
                                      // "Rabat\nCapital History🇲🇦"
                                      ,
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  // SizedBox(width: 12,),

                                  Text(
                                    Audio.duration
                                    // "🎙️Audio 2 m 23s"
                                    ,
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_fill,
                                        size: 37.sp,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Play now",
                                        style: TextStyle(
                                          fontFamily: 'Arial',
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 150.w,
                                height: 150.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage(Audio.imagecover))),
                              )
                              // Image.asset(
                              //
                              //   Audio.imagecover)
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AudioPlayerScreen(
                                      Audio.photos, Audio.name, Audio.audio, Audio.desc)));
                        },
                      );
                    })),

            //  ),
            //  )
            //  ),

            SizedBox(
              height: 30,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Cities', style: MyStyle.blackalarmTextStyle
            //           //     TextStyle(
            //           //     fontFamily: 'Arial',
            //           // fontSize: 20,
            //           // fontWeight: FontWeight.bold,
            //           // color: Colors.black,
            //           //     ),
            //           ),
            //       Container(),
            //       //   InkWell(
            //       //     onTap: () {
            //       //       // Navigator.push(
            //       //       //     context,
            //       //       //     MaterialPageRoute(
            //       //       //         builder: (context) => PopularPlacesScreen()));
            //       //     },
            //       //     child: Text(
            //       //       'View More',
            //       //       style: TextStyle(
            //       //     fontFamily: 'Arial',
            //       // fontSize: 16,
            //       // fontWeight: FontWeight.bold,
            //       // color: Colors.blue,
            //       //     ),
            //       //     ),
            //       //   ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
//             Container(
//                 // color: Colors.red,
// height: 180.h,
//                 child: ListView.builder(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     itemCount: 10,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       final List<CardModule> test = List.from(cardsList.toSet())
//                         ..shuffle();
//                       final CardModule card = test[index];
//                       return InkWell(
//                           onTap: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (_) => DetailsExplore(activity),
//                             //   ),
//                             // );
//                           },
//                           child: Column(
//                             children: [
//                             Container(
//                               margin: EdgeInsets.all(10),
//                               width: 150.w,
//                               height: 100.h,
//                               decoration: BoxDecoration(
//                                 //color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                   image: AssetImage(card.productImg),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 20),
//                               // alignment: Alignment.,
//                               child: Text(
//                                 card.productName,
//                                 style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontFamily: 'Arial',
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                                 textAlign: TextAlign.left,
//                               ),
//                             )
//                           ]));
//                     }

//                     // Container(
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.grey,
//                     //     borderRadius: BorderRadius.circular(14.r),
//                     //     image: DecorationImage(
//                     //       image: NetworkImage(activity.imgurl.toString()),
//                     //       fit: BoxFit.cover,
//                     //     ),
//                     //   ),
//                     // ),
//                     )),

            // SizedBox(
            //   height: 30,
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Audio',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(),
                  //   InkWell(
                  //     onTap: () {
                  //       // Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //         builder: (context) => PopularPlacesScreen()));
                  //     },
                  //     child: Text(
                  //       'View More',
                  //       style: TextStyle(
                  //     fontFamily: 'Arial',
                  // fontSize: 16,
                  // fontWeight: FontWeight.bold,
                  // color: Colors.blue,
                  //     ),
                  //     ),
                  //   ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //PopularActivities(),
            //         Column(
            //   children: List.generate(
            //     audio.length,
            //     (index) => InkWell(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) =>AudioPlayerScreen(
            //                                   audio[index].photos,
            //                                   audio[index].name,
            //                                   audio[index].audio,
            //                                   audio[index].desc)
            //             ),
            //           );
            //         },
            //         child: ActivityCard(activity: audio[index])
            //         ),
            //   ),
            // ),
            GridView.builder(
              primary: true,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.0, // Adjust the aspect ratio as needed
              ),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final AudioModel card = _filteredItems[index];
                return InkWell(  
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AudioPlayerScreen(card.photos, card.name, card.audio, card.desc),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(card.logo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          card.name,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class ActivityCard extends StatelessWidget {
  final AudioModel activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: double.infinity,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(activity.logo,
                  width: double.infinity, height: 280.h, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                activity.name.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(activity.flagname.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: ElevatedButton(
              //   onPressed: () {
              //     // Handle booking
              //   },
              //   child: Text('Book Now'),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
