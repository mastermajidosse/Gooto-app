import 'package:flutter/material.dart';

class AudioModel {
  String audio;
  int? id;
  String name;
  String logo;
  List<String> desc;
  List<String> photos;
  String flagname;
  String duration;
  String imagecover;
  Color color;

  AudioModel({
    required this.audio,
    required this.desc,
    this.id,
    required this.name,
    required this.logo,
    required this.flagname,
    required this.photos,
    required this.duration,
    required this.imagecover,
    required this.color,
  });
  static AudioModel fromData(map) {
    print(map['tags'].toString());
    return AudioModel(
      id: map['id'],
      desc: map['description'],
      name: map['name'].toString(),
      flagname: map['country']['flagname'].toString(),
      logo: map['images'][0].toString(),
      photos: map['photo'],
      audio: map['audio'],
      duration: map['duration'],
      imagecover: map['imagecover'],
      color: map['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'desc': desc,
      "name": name,
      "image": logo,
    };
  }
}

List<AudioModel> audio = [
  AudioModel(
      color: Color(0xFFFF914D),
      imagecover: 'assets/popular/Sahara.jpeg',
      duration: "Audio 2 m 23s 🎙️",
      audio: 'Rabat.mp3',
      flagname: "Create By GooTo",
      desc: [
        "The Moroccan Sahara is a stunning expanse of desert that captures the imagination of visitors from around the world. Spanning a vast area,",
        "It is important to recognize that the Moroccan Sahara is an integral part of Morocco's identity. The region's rich history, cultural heritage, and economic potential reinforce its status as Moroccan territory.",
        "The commitment to developing the Sahara while respecting its unique characteristics reflects Morocco's dedication to unity and progress."
        "this region is not only a geographical marvel but also a cultural treasure that embodies the spirit of Morocco.",
        " The Sahara's landscapes are mesmerizing, featuring golden sand dunes, dramatic rocky outcrops, and breathtaking sunsets that paint the sky in vibrant hues.",
        "The Erg Chebbi dunes, for instance, rise majestically and shift with the winds, creating a dynamic environment that is both serene and awe-inspiring. ",
        " The unique flora and fauna adapted to this arid climate, such as the resilient acacia trees and hardy desert wildlife, further enrich the ecosystem",
        "The Moroccan Sahara is home to diverse communities, each with its own traditions and customs. The Berbers, known for their hospitality and rich cultural heritage,",
        " have lived in harmony with this land for centuries. Their vibrant crafts, music, and storytelling reflect a deep connection to the desert. Visitors can engage with local artisans,",
        "enjoy traditional meals, and experience the warmth of Moroccan hospitality.",
        "Tourism in the Moroccan Sahara is flourishing, attracting adventurers and nature lovers alike. Activities such as camel trekking, dune bashing,",
        " and stargazing provide unforgettable experiences. The annual Festival of the Sahara in Merzouga celebrates local culture through music,",
        " dance, and traditional sports, drawing visitors from around the globe and showcasing the region's vibrant heritage.",
        " The Moroccan Sahara is more than just a desert; it is a vibrant tapestry of natural beauty, cultural richness, and economic opportunity. ",
        " Embracing the Sahara not only enhances Morocco's identity but also invites the world to appreciate the wonders of this remarkable region.",
        
      ],
      id: 1,
      logo: "assets/popular/Sahara4.jpeg",
      name: "Morrocan Sahara",
      photos: [
        "assets/popular/sahara2.jpeg",
        "assets/popular/Sahara4.jpeg",
        'assets/popular/Sahara.jpeg',
        "assets/popular/sahara1.jpeg",
        "assets/popular/Sahara3.jpeg"
      ]),

  AudioModel(
      color: Color(0xFFFF914D),
      imagecover: 'assets/popular/rabat.jpeg',
      duration: "Audio 2 m 23s 🎙️",
      audio: 'Rabat.mp3',
      flagname: "Create By GooTo",
      desc: [
        "Rabat, the stunning capital city of Morocco, is a captivating blend of ancient history and modern sophistication,",
        ". Located along the Atlantic coast, this vibrant metropolis serves as the political and administrative center of the Kingdom of Morocco.",
        " One of the most distinctive features of Rabat is its well -preserved historic core, the Khazba of the Udayas.",
        " This UNESCO World Heritage site dates back to the 12th century and features impressive fortified walls,",
        " intricate Islamic architecture, and winding narrow streets that evoke these rich past. Visitors can explore the Khazba's picturesque blue and white houses,",
        " ornate gateways, and the magnificent Andalusian gardens. The Hassan Tower, an unfinished 12th century minaret,",
        " is another iconic landmark that dominates Rabat's skyline. Standing at an impressive 140 feet tall,",
        " the tower was intended to be part of one of the but construction was halted in the early 1200s. Nearby,",
        " the mausoleum of Muhammad V is a stunning example of Alawit dynasty architecture with its mix of Moorish and modern styles.",
        " Beyond the historic district, Rabat boasts a vibrant contemporary culture. The Vilnouvelle, or New City, features wide boulevards,",
        " impressive government buildings, and a thriving commercial district. Visitors can explore the lively Medina, browse the bustling markets,",
        " and savor the diverse culinary offerings that reflect Morocco's rich gastronomic traditions. The picturesque Buregreg River,",
        " which flows through the heart of Rabat, is another highlight of the city. Strolling along the river's banks or taking a boat tour provides visitors with stunning views of the city's landmarks and the Atlantic Ocean.",
        " Overall, Rabat is a captivating destination that offers a unique blend of ancient history, cultural richness, and modern urban life."
      ],
      id: 1,
      logo: "assets/popular/rabat.jpeg",
      name: "Rabat\nCapital History",
      photos: [
        "assets/popular/rabat.jpeg",
        "assets/popular/rabat2.jpg",
        "assets/popular/rabat3.jpg"
      ]),
  AudioModel(
      color: Color(0xFF9d8191),
      imagecover: 'assets/agadircover.png',
      duration: "Audio 2 m 23s 🎙️",
      audio: 'agadir.wav',
      flagname: "Create By GooTo",
      desc: [
        "In the south of the country, bordered by the waves of the Atlantic,",
        " Agadir is one of the pearls of Morocco. Whatever the season,",
        " the sun pours its rays, and the city enjoys a pleasant climate that the trade winds still soften.",
        " Above all, its 10 -kilometer -long seafront offers tourists magnificent views of the blue ocean and the opportunity to laze around in the best conditions.",
        " The main seaside resort of the country, the city, with 300 days of sunshine per year, ",
        "is full of activities. At the water's edge, CAF -S and restaurants open their doors to you, introduce you to the local gastronomy,",
        " and submit their specialities to the enlightened judgments of your taste buds. Further on in the city, ",
        "the el had souk spreads out through the streets, deploys its stalls, more than 6 ,000 shops offer themselves to your curiosity,",
        " and you will enjoy strolling in this atmosphere animated by the negotiations of the merchants. Never sleepy",
        " the city welcomes every summer the Timatar festival dedicated to world music and more specifically to amazing music dot open to the ocean and the world.",
        " Agadir is an active city where it is good to relax."
      ],
      id: 1,
      logo: "assets/popular/Agadire.jpeg",
      name: "Agadir \nBride of the South",
      photos: [
        "assets/popular/agadire2.jpeg",
        "assets/popular/agadire3.jpeg",
        "assets/popular/agadire4.jpeg",
        "assets/popular/Agadirs-beach.webp"
      ]),
  AudioModel(
      color: Colors.blue,
      imagecover: 'assets/chefchouencover.png',
      duration: "Audio 2 m 23s 🎙️",
      audio: 'chaoun.wav',
      flagname: "Create By GooTo",
      desc: [
        "Built on a mountainside, chefchaouen is a city with a special vibes.",
        "It unique charm gives an impression of unreality. With its blue rinsed houses,",
        "the whole city seems to be bathed in azure. You walk around us if you were in a dream. More than just an ornament,",
        " the beautiful chefchaouen brims with attractions. Its heritage is rich. ",
        'The inescapable Medina with its famous narrow winding alleys is an opportunity to mingle with the local population and to smell',
        " and tasted lights from freshly baked bread to skillfully prepared teagans. ",
        "There is also the Casbah, which stands in the middle of the old quarter.",
        " Its lush gardens, located in the center of the city, are a haven of freshness.",
        " Its museum, which is home to a collection of old weapons, some photos of the city and textiles,",
        " is a must -see. Boasting its unique geographical position,chefchaouen is a paradise for walkers.",
        " Paths of the surrounding mountains offer pleasant hiking activities ",
        ".ul explore a new side of Morocco, that of the Rift Mountain Range, as you stroll them.",
        " Make the most of your stay in the picture -perfect blue city."
      ],
      id: 1,
      logo: "assets/popular/chefchaouen.jpeg",
      name: "Chefchaouen \nBlue city",
      photos: [
        "assets/popular/chefchaouen1.jpeg",
        "assets/popular/chefchaouen2.jpeg",
        "assets/popular/chefchaouen3.jpeg",
        "assets/popular/chefchaouen.jpeg"
      ]),
  AudioModel(
      color: Color(0xFFFF914D),
      imagecover: 'assets/hassane.png',
      duration: "Audio 2 m 23s 🎙️",
      audio: 'ifrane.mp3',
      flagname: "Create By GooTo",
      desc: [
        "Ifrane is a city located in the Middle Atlas Mountains of central Morocco, known for its distinctive alpine-style architecture and natural beauty,",
        ". Here are some key highlights about Ifrane and the surrounding Middle Atlas region:Alpine-Style Architecture:Ifrane is often referred to as the Little Switzerland of Morocco due to its unique architecture.",
        " which features chalets, gables, and pitched roofs reminiscent of alpine towns.This architectural style was introduced during the French protectorate period in the early 20th century",
        " when the city was developed as a summer resort for European residents.",
        " Natural Surroundings:The Middle Atlas Mountains, where Ifrane is situated, are known for their lush, forested landscapes, rugged peaks, and scenic lakes and rivers.",
        "The region is home to several national parks, such as Ifrane National Park, which offer opportunities for hiking, trekking, and outdoor recreation.",
        "Climate and Snowfall:Ifrane experiences a cooler, more temperate climate compared to the rest of Morocco, due to its high elevation (around 1,700 meters or 5,600 feet).",
        "The city is renowned for its heavy snowfall during the winter months, transforming the landscape into a winter wonderland and attracting skiers and snowboarders.",
        "Wildlife and Biodiversity:The Middle Atlas region is known for its diverse wildlife, including the Barbary macaque, a primate species found only in this part of North Africa.",
        "Other notable species include the Endangered Moroccan bear, various bird species, and a variety of endemic plants and flora."
            "Ifrane National Park:Ifrane National Park, established in 1934, is a protected area that covers a significant portion of the Middle Atlas Mountains.",
        "The park is renowned for its cedar forests, home to the Barbary macaque, as well as its scenic lakes, such as Aguelman Sidi Ali and Aguelman Azigza.",
        "Educational and Research Institutions:Ifrane is home to several prominent educational and research institutions, including Al Akhawayn University, the only English-language university in Morocco.",
        "The city also hosts the Royal Institute for the Research on the Amazigh Culture, which focuses on the study and preservation of Berber heritage.",
      ],
      id: 1,
      logo: "assets/popular/ifrane.jpeg",
      name: "Ifrane Moroccan Switzerland",
      photos: [
        "assets/popular/ifrane2.jpeg",
        "assets/popular/ifrane.jpeg",
        "assets/popular/ifrane3.jpeg",
        "assets/popular/ifrane4.jpeg",
        "assets/popular/ifrane5.jpeg",
        "assets/popular/ifrane6.jpeg"
      ]),
  AudioModel(
      color: Color(0xFFFF914D),
      imagecover: 'assets/hassane.png',
      duration: "🎙️Audio 2 m 23s",
      audio: 'marzouga.mp3',
      flagname: "Create By GooTo",
      desc: [
        "The Merzouga Desert, also known as the Erg Chebbi, is a renowned desert destination located in southeastern Morocco, near the border with Algeria.Here are some key highlights about the Merzouga Desert",
        "Stunning Dunes: The Merzouga Desert is characterized by its vast, golden sand dunes, some reaching heights of up to 150 meters (500 feet). These massive dunes, formed by the wind,",
        "create a breathtaking landscape that is a quintessential image of the Sahara Desert.",
        "Erg Chebbi:Erg Chebbi is the name given to the large sand sea or erg (a vast sea of dunes) that dominates the Merzouga region. It is one of the most impressive and accessible ergs in Morocco, making it a popular destination for desert exploration.",
        "Camel Trekking and Camping: Camel trekking is a popular activity in the Merzouga Desert, allowing visitors to experience the traditional mode of transportation across the dunes. Many tour operators offer multi-day camel treks,",
        " with stops for overnight camping under the stars in the desert.",
        "Sunrise and Sunset:Watching the sun rise and set over the vast, undulating dunes is a truly magical experience in the Merzouga Desert.The changing colors and shadows cast by the sun create a mesmerizing and ever-changing landscape.",
        "Berber Culture:The Merzouga region is home to the indigenous Berber people, who have a rich cultural heritage and traditions.Visitors can interact with the local Berber communities, learn about their way of life, and possibly even stay in a traditional Berber desert camp.",
        "Wildlife and Conservation:The Merzouga Desert is home to a diverse array of desert-adapted wildlife, including the Saharan Silver Fox, Fennec Fox, and various species of birds and reptiles.The area is part of the Moroccan Sahara Biosphere Reserve, which aims to protect the fragile desert ecosystem.",
      ],
      id: 1,
      logo: "assets/popular/Marzouga1.jpeg",
      name: "The Merzouga Desert",
      photos: [
        "assets/popular/Marzouga1.jpeg",
        "assets/popular/marzouga2.jpeg2",
        "assets/popular/marzouga3.jpeg",
        "assets/popular/marzouga5.jpeg",
      ]),

  AudioModel(
      color: Color(0xFFFF914D),
      imagecover: 'assets/hassane.png',
      duration: "🎙️Audio 2 m 23s",
      audio: 'jadida.mp3',
      flagname: "Create By GooTo",
      desc: [
        "The Citerne Portugaise, also known as the Portuguese Cistern or the Mazagan Cistern, is a historic structure located in the coastal city of El Jadida, Morocco.",
        " Here are some key details about this remarkable site Historical Background:",
        "The Citerne Portugaise was built in the early 16th century by the Portuguese, who had established a fortified trading post in the city, then known as Mazagan."
            "It was part of the defensive system of the Portuguese-controlled city, serving as a water reservoir and providing a strategic advantage for the occupying forces.",
        "Architectural Design The Citerne Portugaise is an impressive, underground cistern with a vaulted brick ceiling and supported by a series of pillars.The structure is designed in a Manueline-style,"
            " which was a distinct architectural style popular in Portugal during the 16th century, characterized by ornate and intricate decorative elements.",
        "The cistern measures approximately 34 meters (111 feet) long and 34 meters wide, with a depth of 5 meters (16 feet).",
        "Lighting and Acoustics The cistern features a unique lighting system, with a central oculus (circular opening) in the ceiling that allows natural light to filter in, creating a mesmerizing,"
            " almost mystical ambiance.The vaulted design of the structure also produces remarkable acoustic properties, allowing for the amplification and reverberation of sound, making it a popular venue for concerts and performances.",
        "UNESCO World Heritage Site:In 2004, the Citerne Portugaise, along with the entire historic city of El Jadida, was designated as a UNESCO World Heritage Site."
            "This recognition acknowledges the site's exceptional cultural and architectural significance, as a well-preserved example of the Portuguese colonial presence in Morocco.",
        "Modern Use and Preservation:Today, the Citerne Portugaise is a major tourist attraction in El Jadida, drawing visitors from around the world to marvel at its unique design and historical importance",
        ".The site is carefully maintained and managed by the local authorities, ensuring the preservation of this remarkable piece of Moroccan and Portuguese heritage."
      ],
      id: 1,
      logo: "assets/popular/jdida1.jpeg",
      name: "ElJadida",
      photos: [
        "assets/popular/jdida1.jpeg",
        "assets/popular/jdida2.jpeg",
        "assets/popular/jdida3.jpeg",
        "assets/popular/jdida4.jpeg",
      ]),
  AudioModel(
      color: Color(0xFFFF914D),
      imagecover: 'assets/hassane.png',
      duration: "🎙️Audio 2 m 23s",
      audio: 'Taghazoute.mp3',
      flagname: "Create By GooTo",
      desc: [
        "Taghazout is a charming fishing village situated along the Atlantic coast, approximately 18 km north of Agadir.",
        "It has become renowned as a premier surfing destination in Morocco, attracting surfers from around the world to its consistent and powerful waves.",
        "The village has a laid-back, bohemian atmosphere, with a mix of local Moroccan culture and an international surf community.Aside from surfing,",
        "Taghazout offers other outdoor activities like beach volleyball, hiking, and exploring the nearby coves and cliffs.The town has a growing number of surf camps, yoga retreats, and eco-lodges,",
        "catering to the influx of visitors seeking a tranquil, beachside getaway.Taghazout is also known for its fresh seafood, with numerous local restaurants and cafes serving up delectable dishes."
      ],
      id: 1,
      logo: "assets/popular/Taghazout.jpeg",
      name: "Taghazout",
      photos: [
        "assets/popular/Taghazout2.jpeg",
        "assets/popular/Taghazout3.jpeg",
        "assets/popular/Taghazout4.jpeg",
        "assets/popular/Taghazout6.jpeg",
        "assets/popular/Taghazout.jpeg"
      ]),
  AudioModel(
    audio: 'casablanca.mp3',
    desc: [
      "Casablanca, Morocco's largest city and economic hub, offers a unique blend of modernity and tradition.",
      " One of the city's most iconic landmarks is the Hassan Mosque, one of the largest mosques in the world.",
      " Its stunning architecture, intricate tile work and the fact that it is built partly over the Atlantic Ocean make it a must visit site.",
      "The Corniche, a picturesque seaside promenade, is a great place to take a leisurely stroll and enjoy the ocean views. It is lined with cafes, restaurants and luxury hotels,",
      "making it a popular spot for both locals and tourists. For a taste of Casablanca's French colonial past, head to the Habous Quarter.",
      "This charming neighbourhood is filled with narrow streets, traditional markets and beautiful colonial buildings. The Royal Palace,",
      "although not open to the public, is another impressive sight worth seeing. The Morocco Mall, one of the largest shopping centres in Africa, ",
      "offers a wide range of international brands and indoor aquarium and a large food court, making it a great place for shopping and entertainment."
    ],
    name: 'Casablanca',
    logo: 'assets/popular/casablanca.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/casablanca1.jpeg',
      'assets/popular/casablanca2.jpeg',
      'assets/popular/casablanca3.jpeg',
      'assets/popular/casablanca4.jpeg',
      'assets/popular/casablanca5.jpeg',
      'assets/popular/casablanca6.jpeg',
      'assets/popular/casablanca.jpeg'
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.blue,
  ),
  AudioModel(
    audio: 'Essouira.mp3',
    desc: [
      "Essaouira, also known as the Wind City, is a charming coastal town known for its beautiful beaches,",
      "historic Medina and vibrant art scene. The Medina.A Unesco World Heritage Site, is surrounded by impressive fortifications and offers a maze of narrow streets filled with shops,",
      "galleries and cafes. The Scala de la Ville, an old fortress with ramparts and cannons overlooking the Atlantic Ocean,",
      "provides stunning views and a glimpse into the town's maritime history. The nearby Moulay Hassan Square is a great place to relax and enjoy the laid back atmosphere of Essaouira. ",
      "For water sports enthusiasts, the beach is a popular spot for windsurfing and kitesurfing thanks to the strong Atlantic winds. The annual Genoa World Music Festival, held in June,",
      "attracts musicians and visitors from around the world and is a highlight of the town's cultural calendar. The port, with its vibrant blue fishing boats and bustling fish market,",
      "is another must visit site. You can watch the fishermen bring in their daily catch and sample some of the freshest seafood in the town's many restaurants."
    ],
    name: 'Essouira',
    logo: 'assets/popular/Essouira2.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/Essouira2.jpeg',
      'assets/popular/Essouira.jpeg',
      'assets/popular/Essouira1.jpeg',
      'assets/popular/Essouira3.jpeg',
      'assets/popular/Essouira4.jpeg',
      'assets/popular/Essouira5.jpeg',
      'assets/popular/Essouira6.jpeg',
      'assets/popular/Essouira7.jpeg'
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.blue,
  ),
  AudioModel(
    audio: 'fes.mp3',
    desc: [
      "Fes known as Morocco's spiritual capital is home to one of the oldest and",
      "most well preserved medieval cities in the world.The Fes El Bali Medina,a Unesco world heritage site is a labyrinth of narrow",
      "streets,ancient mosques and bustling markets.One of the city's most famous landmarks is the University of Al Kain.",
      "The oldest continuously operating university in the world,founded in 859 ad the boo in Anaya Madrasa,an exquisite example of marine architecture is another must visit site in ",
      "Fess.Its intricate tile work,carved wooden details and serene courtyard offer a glimpse into the city'srich cultural heritage for a panoramic view of the city.",
      "Head to the marinade tombs which overlook the Medina and offer stunning vistas of thesurrounding area.",
      "The Shaara Tannery,one of the oldest tanneries in the world provides a fascinating insight into thetraditional leather making process and is a must see for visitors."
    ],
    name: 'Fes',
    logo: 'assets/popular/fes.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/fes1.jpeg',
      'assets/popular/fes.jpeg',
      'assets/popular/fes2.jpeg',
      'assets/popular/fes3.jpeg',
      'assets/popular/fes4.jpeg'
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.yellow,
  ),
  AudioModel(
    audio: 'Marrakech.mp3',
    desc: [
      "Marrakesh often referred to as the red city due to its distinctive red sandstonebuildings is a vibrant and bustling hub of Moroccan culture.",
      'At the heart of the city lies the historic Medina,a unesco world heritage site filled with winding alleyways,bustling souks and stunning architecture.',
      'One of the must visit places in Marrakesh is the Jama El Fna a lively square that transforms into a dazzling night market filled with food',
      'stalls,performers and artisans.Another highlight is the Majel Garden,a beautiful botanical garden designed by French artist Jacques Majel and',
      'later restored by fashion designer Yves,Saint Laurent.The garden s vibrant blue structures and exotic plant species create a'
    ],
    name: 'Marrakech',
    logo: 'assets/popular/marrakech.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/marrakech.jpeg',
      'assets/popular/marrakech1.jpeg',
      'assets/popular/marrakch2.jpeg',
      'assets/popular/marrakech3.jpeg'
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.red,
  ),
  AudioModel(
    audio: 'Meknes.mp3',
    desc: [
      "Meknes,one of Morocco's four imperial cities is known for its grand architecture,",
      "historic sites and laid back atmosphere.The city is surrounded by impressive walls and gates with the Bob Mansour being the most",
      "famous.This grand gateway is adorned with intricate tile work and carvings,",
      "making it one of the most photographed sites in mcneese.The royal stables built to house the sultan's horses are another impressive sight.",
      "The vast vaulted stables could accommodate up to 12,000 horses and are a testament to the grandeur of Meknes.",
      "Past the mausoleum of Moulay Ismail.The resting place of the city's founder is a beautiful and serene site that is open to non Muslim visitors.",
      "The mausoleum is adorned with intricate mosaics,marble columns and detailed stucco work for a glimpse into Mikushistory.",
      "Visit the Dar Jemaah museum housed in a beautiful 19th century palace.The museum features a collection of traditional Moroccan arts and crafts,including pottery,",
      "textiles and jewelry."
    ],
    name: 'Meknes',
    logo: 'assets/popular/meknes.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/meknes.jpeg',
      'assets/popular/meknes1.jpeg',
      'assets/popular/meknes2.jpeg',
      'assets/popular/meknes3.jpeg',
      'assets/popular/meknes4.jpeg',
      'assets/popular/meknes5.jpeg',
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.red,
  ),
  AudioModel(
    audio: 'Ouarzazate.mp3',
    desc: [
      "Ouarzazate, known as the door to the desert, is a gateway to the stunning landscapes of southern Morocco.",
      "The town is famous for its film studios, where many Hollywood movies and TV shows have been filmed. The Atlas Film Studios offer guided tours,",
      "giving visitors a behind the scenes look at the sets and props used in famous productions. The Casbah of Taourirt,",
      "a Unesco World Heritage Site, is one of the most impressive and well-preserved kasbahs in Morocco. The casbahs maze of rooms,",
      "courtyards and towers provides a fascinating insight into the traditional architecture of the region. Eight Benhaddou. Another Unesco World Heritage Site,",
      "located just outside Ouarzazate, is a stunning fortified village that has been featured in numerous films and TV shows. ",
      "The village's mud brick buildings and dramatic setting make it a must visit site for those looking to explore the desert. Ouarzazate is the starting point for many excursions into the Sahara.",
      "Whether you choose a camel trek, a 4x4 adventure or a night in a desert camp, the Sahara offers a truly unforgettable experience.",
      "These stories capture the essence of Morocco's diverse cities and their unique attractions, perfect for transforming into engaging audio content."
    ],
    name: 'Ouarzazate',
    logo: 'assets/popular/ouarzazate.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/ouarzazate.jpeg',
      'assets/popular/ouarzazate1.jpeg',
      'assets/popular/ouarzazate2.jpeg',
      'assets/popular/ouarzazate3.jpeg',
      'assets/popular/ouarzazate4.jpeg',
      'assets/popular/ouarzazate5.jpeg',
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.red,
  ),
  AudioModel(
    audio: 'RifMountains.mp3',
    desc: [
      "Nestled in the Rif Mountains, the town of Chefchaouen is known as the blue Pearl of Morocco. Famous for its striking blue washed buildings",
      "Chefchaouen is a picturesque escape from the hustle and bustle of city life. Founded in 1471, the town has a rich history influenced by Spanish and Moorish architecture.",
      "As you wander through its narrow, winding streets, you'll be greeted by friendly locals and vibrant markets.",
      "The blue hue believed to ward off mosquitoes and symbolise the sky and heaven, creates a calming and serene atmosphere. Key landmarks include the Grand Mosque,",
      "with its distinctive octagonal minaret, and the Casbah, which houses a lovely garden and a small museum. Surrounded by lush valleys and dramatic mountains,",
      "Chefchaouen offers both cultural experiences and stunning natural beauty, making it a beloved destination for travellers."
    ],
    name: 'RifMountains',
    logo: 'assets/popular/Rif1.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/Rif.jpeg',
      'assets/popular/Rif1.jpeg',
      'assets/popular/Rif2.jpeg',
      'assets/popular/Rif3.jpeg',
      'assets/popular/Rif4.jpeg',
      'assets/popular/Rif5.jpeg',
      'assets/popular/Rif6.jpeg',
      'assets/popular/Rif7.jpeg',
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.red,
  ),
  AudioModel(
    audio: 'Tanger.mp3',
    desc: [
      "Tangier,",
      "located at the crossroads of Africa and Europe is a city with a rich and diverse history.",
      "The Medina with its narrow streets and whitewashed buildings offers a glimpse",
      "into the city's past the Kasbah Museum located in the former Sultan'spalace,",
      "showcases a collection of artifacts and provides an insight into the city's history and culture.The American Legation Museum,",
      "the first American public property outside the United States is another interesting site.",
      "It highlights the historical ties between Morocco and the United States and features a",
      "collection of artwork and historical documents for stunning views of the Strait of Gibraltar.",
      "Head to the Cap Sp Bartel where the Atlantic Ocean meets the Mediterranean Sea.",
      "The nearby caves of Hercules shrouded in myth and legend are also worth a visit.The Grand Soko,",
      "a lively square at the entrance to the Medina is a great place to relax and watch the hustle and bustle of daily life.",
      "The square is surrounded by cafes, shops and the historic cinema.Riff"
    ],
    name: 'Tanger',
    logo: 'assets/popular/tanger.jpeg',
    flagname: 'Create By GooTo',
    photos: [
      'assets/popular/tanger5.jpeg',
      'assets/popular/tanger1.jpeg',
      'assets/popular/tanger2.jpeg',
      'assets/popular/tanger3.jpeg',
      'assets/popular/tanger4.jpeg',
      'assets/popular/tanger.jpeg',
    ],
    duration: '2m10s',
    imagecover: '',
    color: Colors.red,
  ),

  //  AudioModel(
  // audio: 'test.mp3',
  // desc: "",
  // flagname:"Create By GooTo" ,
  // id:1 ,
  // logo:"assets/Rabat.webp" ,
  // name: "Rabat Capital,History",
  // photos: ["assets/Rabat.webp","assets/theatreRabat.jpeg","assets/rabatcapitale.jpg"]),
  //      AudioModel(
  // audio: 'test.mp3',
  // desc: "",
  // flagname:"Create By GooTo" ,
  // id:1 ,
  // logo:"Rabat.webp" ,
  // name: "Rabat Capital,History",
  // photos: ["assets/Rabat.webp","assets/theatreRabat.jpeg","assets/rabatcapitale.jpg"]),
];
