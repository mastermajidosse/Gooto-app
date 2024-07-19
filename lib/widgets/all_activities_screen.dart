import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gooto/config/demo.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/models/card.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';
import 'package:gooto/widgets/custm_card.dart';
import 'package:gooto/widgets/popular_activities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllActivitiesScreen extends StatelessWidget {
  AllActivitiesScreen({super.key});

  List<BlogModel> activities = BlogModel().activities;

  List<String> cities = [
    'Casablanca',
    'Fes',
    'Tanger',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Activities"),
        actions: [
          IconButton(
              onPressed: () {
                print("search");
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(children: [
          Container(
            // color: Colors.red,
            height: 200.h,
            child: GridView.count(
              primary: false,
              padding: EdgeInsets.all(10.r),
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              crossAxisCount: 2,
              children: activities.map((activity) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsExplore(activity),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(14.r),
                        image: DecorationImage(
                          image: NetworkImage(activity.imgurl.toString()),
                          fit: BoxFit.cover,
                        )),
                  ),
                );
              }).toList(),
            ),
          ),
          ...List.generate(
            activities.length,
            (index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailsExplore(activities[index]),
                    ),
                  );
                },
                child: ActivityCard(activity: activities[index])),
          ).toList(),
        ]),
      )),
    );
  }
}
