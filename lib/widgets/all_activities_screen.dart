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
    BlogModel(
      title: 'Hiking Morocco: The Mount Toubkal Trek',
      price: 'from £115.67 per adult',
      desc:
          """<p style="color: #444;text-align:justify">Summiting Mount Toubkal—North Africa’s highest peak—is a rewarding experience, and one that, because it requires no technical climbing, is accessible to most travelers with reasonable fitness. With this tour, ascend at your own pace and receive undivided attention and one-on-one support from a private guide. Most of the planning, from arranging transport to overnight accommodation and mules to carry packs, is done for you.</p>,""",
      imgurl:
          'https://i.pinimg.com/564x/95/ba/43/95ba431eb8b7cf30cc859153a61acd97.jpg',
    ),
    BlogModel(
      title: 'Hot Air Balloon Flight',
      price: 'from £220 per adult',
      desc:
          """<p style="color: #444;text-align:justify">Embark on a spectacular adventure above Marrakech and its surroundings with our classic hot air balloon flight for 16 to 20 people. Before dawn, you will witness the hypnotic spectacle of the balloon inflation and then board our large basket for a celestial journey offering a 360-degree panoramic view.</p>
         <p style="color: #444;text-align:justify">As the sun rises, you will soar not only over the city of Marrakech with its ancient ramparts and bustling markets, but also enjoy breathtaking views of the majestic Atlas Mountains, whose snow-capped peaks beautifully contrast with the morning sky. To the east, the Agafay Desert stretches out its vast arid expanses, offering a spectacular lunar landscape that contrasts with the greenery of the surrounding oases.</p>""",
      imgurl:
          'https://i.pinimg.com/564x/82/c8/9e/82c89ed84c0a1c264358a58984dbfd4f.jpg',
    ),
    BlogModel(
        title: 'Agafay Desert Package: Quad Bike, Camel Ride, and Dinner Show',
        price: 'from £36.31 to £45.39 per adult',
        desc:
            """<p style="color: #444;text-align:justify">On an action-packed day trip from Marrakesh, enjoy camel riding and quad biking in the Agafay desert. Enjoy views of the desert and Berber hospitality with a traditional meal. Take advantage of the hotel pickup service and head to the base camp for a meeting with your entire crew. Your tour's itinerary will be explained to you by your crew leader. Then, meet your guide and don a nomadic outfit before embarking on a scenic camel ride across the desert. Ride your camel across the desert. Then, hop on a quad bike and find a vantage point to take in the Agafay Desert's unique beauty at sunset. Relax and take in the scenery, as well as the genuine Moroccan hospitality. Finish your day by sitting under a Berber tent and gazing at the stars, as a delicious traditional meal is served.</p>""",
        imgurl:
            'https://i.pinimg.com/564x/2d/5a/5f/2d5a5fd63aaa0ac6fb6e6e703787089b.jpg'),
    BlogModel(
      title: 'Agadir Jetski Experience & Adventure',
      price: 'from £40.27 per adult',
      desc:
          """<p style="color: #444;text-align:justify">We invite customers to enjoy a wonderful experience at the picturesque sea of Agadir. You can book the jet-ski anytime during the day, morning or afternoon, and it takes place on the beach of Agadir. Departure and pick-up are in front of the exit of your hotel, with the time fixed by the customer. It is a very pleasant and enjoyable experience. On the way back, we will also drop you off at your hotel.</p>""",
      imgurl:
          'https://i.pinimg.com/564x/3d/47/b4/3d47b44fd7e02eb4705a8b7eaac4ae56.jpg',
    ),
    BlogModel(
        title: 'Scuba Diving in Belyounech',
        price: 'from £40 per adult',
        desc:
            """<p style="color: #444;text-align:justify">Explore the diving spots of Belyounech on this excursion. The tour suits all skill levels, from beginners and first-timers to advanced divers. While underwater, spot various marine life, including turtles, sea lions, rays, sharks, eels, and colorful fish such as angelfish and yellowtail surgeonfish.</p>""",
        imgurl:
            'https://i.pinimg.com/564x/e5/78/c7/e578c7123da629e0a94b913c1f5ef86a.jpg'),
    BlogModel(
      title: 'Snowboarding and Skiing in Oukaïmeden',
      price: 'from £30 per adult',
      desc:
          """<p style="color: #444;text-align:justify">Discover the thrill of snowboarding and skiing in Oukaïmeden, Morocco's premier ski resort. Nestled in the High Atlas Mountains, this resort offers an array of slopes that cater to all skill levels, from beginners to seasoned experts. Whether you're carving through fresh powder or mastering your first turns, Oukaïmeden provides an exhilarating experience for every winter sports enthusiast.</p>""",
      imgurl:
          'https://i.pinimg.com/564x/53/9b/29/539b292e030c7cec85333ca9c8a5871f.jpg',
    ),
    BlogModel(
      title: 'Paintball Fight Club in Marrakech, Tanger, Tetouan, and Agadir',
      price: 'from £18 per adult',
      desc:
          """<p style="color: #444;text-align:justify">Paintball is considered to be a fun activity that consolidates the values of group work, whether it is between family members, friends, or colleagues. It has a strong strategic dimension, energizes teams, and improves communication between its members. These elements strengthen existing links and, in the end, pleasure and joy prevail.</p>
         <p style="color: #444;text-align:justify">Paintball offers three paintball fields with different configurations and movable obstacles. It's a friendly space to bring together your relatives, friends, or colleagues in a setting where good humor reigns.</p>""",
      imgurl:
          'https://i.pinimg.com/564x/2c/38/98/2c389847a9858eb9d42a32ec5dbafb92.jpg',
    ),
    BlogModel(
      title: 'Kitesurfing Lessons in Essaouira Beach',
      price: 'from £51.41 per adult',
      desc:
          """<p style="color: #444;text-align:justify">Explora Watersports is one of the only watersports centres located right on the beach at the optimum spot for kitesurfing. All of our instructors are fully qualified and we have brand new equipment each year. We are a family-run business whose aim is to ensure you have a great time with us on and off the water.</p>""",
      imgurl:
          'https://i.pinimg.com/564x/68/09/4b/68094b83e1eca8beb8a833a3f3efb219.jpg',
    ),
    BlogModel(
        title: 'Parachute Airclub in Beni Mellal',
        price: 'from £286.24 per adult',
        desc:
            """<p style="color: #444;text-align:justify">Experience the thrill of skydiving at the Parachute Airclub in Beni Mellal. This adventure is perfect for all skill levels, from beginners making their first jump to experienced skydivers seeking a new challenge. As you soar through the skies, enjoy breathtaking views of the Atlas Mountains and the scenic landscapes below. The professional instructors ensure a safe and exhilarating experience, making it an unforgettable adventure. Whether you're a thrill-seeker or looking to conquer your fears, the Parachute Airclub offers a unique way to explore Beni Mellal from above.</p>""",
        imgurl:
            'https://i.pinimg.com/564x/a7/75/5a/a7755ace12e97624f52b6da022447f8d.jpg'),
    BlogModel(
        title: '2-Hour Horseback Ride on Essaouira Beach',
        price: 'from £29.47 per adult',
        desc:
            """<p style="color: #444;text-align:justify">Discover the dunes, forest, and breakers of the Atlantic coast of Essaouira during a private horseback riding adventure. Whether you are an expert or have never ridden before, anyone over 10 years old can have fun in a stable 3 km from the medina of Essaouira. Your guide will select the perfect horse and tailor the pace to your group's experience. In addition to helmets, your day includes round-trip transfers from the city.</p>""",
        imgurl:
            'https://i.pinimg.com/564x/c6/c0/4b/c6c04b6c49e4f6ffd97550cf93f7e0ee.jpg'),
    BlogModel(
        title: 'Paragliding in Marrakech Agafay Desert Sunset',
        price: 'from £59.98 per adult',
        desc:
            """<p style="color: #444;text-align:justify">If you want a thrill flying through the pastel sunset sky outside Marrakech, then book this paragliding experience in the Agafay Desert. There will be plenty of time for taking photos of the desert and drinking Berber tea, in addition to your sunset flight. Hassle-free transfers from Marrakech are also taken care of for you. You just meet your driver at your hotel, then get ready to fly.</p>""",
        imgurl:
            'https://i.pinimg.com/564x/56/90/54/569054064a1c6b6bc17b99bcb84c7693.jpg'),
    BlogModel(
      title: 'SkyDiving – A Breathtaking Experience',
      price: 'from £286.24 per adult',
      desc:
          """<p style="color: #444;text-align:justify">Fly through the sky over the Atlas Mountains on this private skydive experience from Marrakech. You’ll have a vantage point not many ever get to see with this excursion. You’ll be collected from your hotel in Marrakech for ease, then taken to the skydive site. You’ll have instruction and equipment provided, so you’ll be ready for your exhilarating flight.</p>""",
      imgurl:
          'https://i.pinimg.com/564x/3e/75/b0/3e75b0f6f6bc04521240428a363f61fd.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        child: Column(
          children: [
            Container(
              // color: Colors.red,
              height: 160.h,
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(10.r),
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                children: activities.reversed.map((activity) {
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
                          color: Colors.grey,
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
            SizedBox(height: 60.h),
          ],
        ),
      )
      ),
    );
  }
}
