import 'package:flutter/material.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/screen/exolore/explore_detail.dart';

class PopularActivities extends StatelessWidget {
  final List<BlogModel> activities = [
    BlogModel(
      title: 'Essaouira: 3-hour surf lesson with local',
      price: '\$25 per person / 2hours',
      desc:
          'Surf lessons are a great way for beginners to learn the basics of surfing and improve their skills. Most surf lessons include both on-land and on-water instruction, and will cover topics such as surfboard and wetsuit selection, wave theory, paddling technique, and standing up on the board.If you’re a complete beginner, it’s generally recommended to start with a beginner lesson In order to discover surfing, which will cover the basics of the sport and give you a good foundation to build on. Once you have a solid understanding of the basics, you can then progress to intermediate lessons to continue improving your skills.Surf lessons can be a fun and rewarding way to learn a new sport, and can provide a sense of accomplishment and enjoyment for people of all ages and abilities.',
      imgurl:
          'https://surfariessaouira.com/wp-content/uploads/bb-plugin/cache/image-40-600x400-circle.jpg',
    ),
    BlogModel(
      title: 'Merzouga: 3-Day Desert Safari with Food',
      price: '\$110 per person',
      desc:
          'Experience the Moroccan Sahara Desert on a 3-day safari tour from Marrakech to Merzouga. Spend the night at a Bedouin camp in the Erg Chebbi dunes. Ride a camel to watch the sunset and sunrise. See the Kasbah of Ouarzazate, and much more.',
      imgurl: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/0e/de/95/2a.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
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
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final BlogModel activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(activity.imgurl.toString(), fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                activity.title.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(activity.price.toString()),
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
