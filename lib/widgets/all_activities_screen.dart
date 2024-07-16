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

  final List<BlogModel> activities = [
    BlogModel(
      title: 'Essaouira: 3-hour surf lesson with local',
      price: '\$25 per person / 2hours',
      desc: """
<body>
    <div class="container">
        <div class="header">
            <h1 >Surf Lessons for Beginners</h1>
        </div>
        <div class="content">
            <p style="color: #444;text-align:justify">Surf lessons are a great way for beginners to learn the basics of surfing and improve their skills. Most surf lessons include both on-land and on-water instruction, and will cover topics such as surfboard and wetsuit selection, wave theory, paddling technique, and standing up on the board.</p>
            <p style="color: #444;text-align:justify">If you’re a complete beginner, it’s generally recommended to start with a beginner lesson in order to discover surfing, which will cover the basics of the sport and give you a good foundation to build on. Once you have a solid understanding of the basics, you can then progress to intermediate lessons to continue improving your skills.</p>
            <p style="color: #444;text-align:justify">Surf lessons can be a fun and rewarding way to learn a new sport, and can provide a sense of accomplishment and enjoyment for people of all ages and abilities.</p>
        </div>
    </div>
</body>
""",
      imgurl:
          'https://surfariessaouira.com/wp-content/uploads/bb-plugin/cache/image-40-600x400-circle.jpg',
    ),
    BlogModel(
      title: 'Merzouga: 3-Day Desert Safari with Food',
      price: '\$110 per person',
      desc:
          """<p style="color: #444;text-align:justify">Experience the Moroccan Sahara Desert on a 3-day safari tour from Marrakech to Merzouga. Spend the night at a Bedouin camp in the Erg Chebbi dunes. Ride a camel to watch the sunset and sunrise. See the Kasbah of Ouarzazate, and much more.</p>
          """,
      imgurl:
          'https://media.tacdn.com/media/attractions-splice-spp-674x446/0e/de/95/2a.jpg',
    ),
  ];

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
