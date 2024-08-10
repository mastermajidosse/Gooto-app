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
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Best Audio Stories🎤',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          primary: true,
          children: [
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
              alignment: Alignment.topLeft,
              child: Text('Top Cities 🔥', style: MyStyle.blackalarmTextStyle),
            ),
            SizedBox(height: 10),
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
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 12, top: 7),
                                    child: Text(
                                      Audio.name,
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    Audio.duration,
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
            SizedBox(height: 30),
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
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
              primary: true,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 80.h / 100.w, // Adjust the aspect ratio as needed
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
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            image: AssetImage(card.logo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: Text(
                          card.name,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
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
          ],
        ),
      ),
    );
  }
}
